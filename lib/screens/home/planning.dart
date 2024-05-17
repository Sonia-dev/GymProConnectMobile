
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/my_booking_controller.dart';
import 'package:gymproconnect_flutter/data/controllers/planning_controller.dart';
import 'package:gymproconnect_flutter/data/repository/planning_repo.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../data/api/api_client.dart';
import 'Profil.dart';
import 'profil.dart';
import 'abonnement.dart';
import 'main_home.dart';


import 'package:lottie/lottie.dart';

class Planning extends GetView<MyBookingController> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Planning',
            style: TextStyle(
              fontSize: 24.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder<PlanningController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    TableCalendar(
      
                      calendarFormat: _calendarFormat,
                      firstDay: DateTime.utc(2022),
                      lastDay: DateTime.utc(2025),
                      focusedDay: DateTime.now(),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      daysOfWeekHeight: 25.h,
                      rowHeight: 45,
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        headerMargin: EdgeInsets.only(bottom: 10),
                        formatButtonVisible: false,
                        leftChevronVisible: false,
                        rightChevronVisible: false,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
      
                        selectedTextStyle: const TextStyle(color: Colors.white),
      
      
      
                      ),
      
                      onPageChanged: (focusedDay) {
                        controller.focusedDay = focusedDay;
                        controller.onDaySelected(
                            focusedDay, focusedDay);
                      },
                      selectedDayPredicate: (day) => isSameDay(controller.selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
      
                          _selectedDay = selectedDay;
                        print(_selectedDay);
                          controller.onDaySelected(selectedDay, focusedDay);
                          controller.getBookings(selectedDay);
      
                      },
                    ),

                Obx(()=>controller.loading.value == true ? Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 80.h),
                    child: SpinKitDoubleBounce(
                          color :Colors.orange
                        ),
                  ),
                ) :Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child:

                        Obx(()=>controller.bookingList.value!.isEmpty?Padding(
                            padding: EdgeInsets.only(bottom:20.h),
                            child:  Column(
                              children: [
                                Expanded(
                                  child: Lottie.asset(
                                  
                                      'assets/lotties/no_sessions.json'),
                                ),
                                Text('Pas se session ajourd hui ')
                              ],
                            ),
                          ):ListView.builder(
                            padding: EdgeInsets.only(bottom: 75.h),
                            itemCount: controller.bookingList?.length,
                            itemBuilder: (context, index) {
                              final session = controller.bookingList?[index];
                              return
                              Card(
                                child: ListTile(
                                  title: Text(session!.activity!.name??""),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (session?.createdAt != null)
                                        Text('Start: ${session?.createdAt}'),
                                      if (session?.createdAt != null)
                                        Text('End: ${session?.createdAt}'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
      
      
      
                      ),
                    ))
      
                  ],
                )
      
                );
          }
        ),
      
      
        bottomNavigationBar: Stack(
            children: [
      
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BottomAppBar(
                  color: Color(0xFFFFFFFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.home, color: Color(0xFFA5A5A7)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MainHome()),
                                  );
                                },
                              ),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(color: Color(0xFFA2A2A2), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.calendar_today_rounded,color:Color(0xFFf34e3a)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Planning()),
                                  );
                                },
                              ),
                            ),
                            Text(
                              'Planning',
                              style: TextStyle(fontSize: 12,color:Color(0xFFf34e3a)),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.access_time,color: Color(0xFFA5A5A7)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => abonnement()),
                                  );
                                },
                              ),
                            ),
                            Text(
                              'Abonnement',
                              style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Flexible(
                              child: IconButton(
                                icon: Icon(Icons.person,color: Color(0xFFA5A5A7),),
                                onPressed: () {
                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Profil()),
                                  );*/
                                },
                              ),
                            ),
                            Text(
                              'Profil',
                              style: TextStyle(fontSize: 12,color: Color(0xFFA5A5A7)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Container(
                    height: kToolbarHeight/6, // Utilise kToolbarHeight pour la hauteur de la barre d'applications
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
      
                      ),
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
      
                          Color(0xFFDCDCDC),
                          Color(0xFFDCDCDC).withOpacity(0)
                        ],
                      ),
                    )
                ),
              ),
            ]
        ),
      
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFf34e3a),
          onPressed: () {},
          child: Image.asset("assets/scanner.jfif",width: 30,height: 30,),
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

