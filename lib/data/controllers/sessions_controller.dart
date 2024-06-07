import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../../models/session_coach_model.dart';
import '../repository/sessions_repo.dart';

class SessionCoachController extends GetxController {
  final SessionsRepo sessionsRepo;

  SessionCoachController({required this.sessionsRepo});

  RxBool isLoading = false.obs;
  RxList<Sessionscoach> sessionList = <Sessionscoach>[].obs;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  set selectedDay(value) => _selectedDay = value;

  DateTime get selectedDay => _selectedDay;

  DateTime get focusedDay => _focusedDay;

  set focusedDay(value) => _focusedDay = value;
  var events = <DateTime, List<Sessionscoach>>{}.obs;

  @override
  void onReady() {
    getSession();
    super.onReady();
  }

  Future<void> getSession() async {
    try {
      isLoading.value = true;
      Response response = await sessionsRepo.getSessionList();
      if (response.statusCode == 200) {
        print("sessionList1:$sessionList");

        List<dynamic> responseData = response.body["sessions"];
        sessionList.assignAll(
            responseData.map((data) => Sessionscoach.fromJson(data)).toList());
        print("sessionList:$sessionList");
        updateEventsMap();
      } else {
        print("Error: ${response.statusText}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void updateEventsMap() {
    events.clear();
    sessionList.forEach((session) {
      DateTime sessionDate = DateTime.parse(session.date!);
      if (events.containsKey(sessionDate)) {
        events[sessionDate]!.add(session);
      } else {
        events[sessionDate] = [session];
      }
    });
  }

  void updateSelectedDaycoach(DateTime newSelectedDay) {
    if (newSelectedDay != null) {
      _selectedDay = newSelectedDay;
      update();
    }
  }

  void onPageChanged(DateTime focusedDay) {
    if (focusedDay != null) {
      _focusedDay = focusedDay;
      updateEventsMap();
    }
  }

  void onDaySelectedcoach(DateTime selectedDay, DateTime focusedDay) {
    if (selectedDay != null && focusedDay != null) {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      updateEventsMap();
      update();
    }
  }

  List<Sessionscoach> loadEventsForDaycoach(DateTime day) {
    return events[day] ?? [];
  }

  String formatHour(String hour) {
    final parsedTime = DateFormat('HH:mm:ss').parse(hour);
    return DateFormat('HH:mm').format(parsedTime);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
