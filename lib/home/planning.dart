import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/abonnement.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/utils/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Planning extends StatefulWidget {
  const Planning({Key? key}) : super(key: key);

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar( title:Text('Planning',style: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Poppins.ExtraBold',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10), // Marge supplémentaire pour l'en-tête
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_today), // Ajouter l'icône de calendrier
                        SizedBox(width: 5), // Espacement entre l'icône et le titre
                        Text('Custom Header', style: TextStyle(color: Colors.black)), // Titre personnalisé
                      ],
                    ),
                  ),
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    firstDay: DateTime.utc(2022),
                    lastDay: DateTime.utc(2025),
                    focusedDay: _selectedDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    headerStyle: HeaderStyle(

                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),
                      ),

                    ),

                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    calendarBuilders: CalendarBuilders(
                      markerBuilder: (context, date, events) {
                        final children = <Widget>[];

                        if (events.isNotEmpty) {
                          children.add(
                            Positioned(
                              right: 1,
                              bottom: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.pink,
                                ),
                                width: 20.0,
                                height: 20.0,
                                child: Center(
                                  child: Text(
                                    events.length.toString(),
                                    style: TextStyle(color: Color(0xFFFF2D55)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        return children.isNotEmpty ? children.first : null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}





class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainHome()),
                      );
                    },
                  ),
                ),
                Text('Home',style: TextStyle(fontSize: 12)  ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.calendar_today_rounded, color: Color(0xFFf34e3a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Planning()),
                      );
                    },
                  ),
                ),
                Text('Planning', style: TextStyle(fontSize: 12,color: Color(0xFFf34e3a),),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,

              ),
              child: CircleAvatar(
                backgroundColor: Color(0xFFf34e3a),
                child: Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.access_time,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abonnement()),
                      );
                    },
                  ),
                ),

                Text('Abonnement',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => profil()),
                      );
                    },
                  ),
                ),
                Text('Profil',style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

