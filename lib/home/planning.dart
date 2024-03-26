import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Planning extends StatefulWidget {
  const Planning({Key? key}) : super(key: key);

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar( title:Text('Planning',style: TextStyle(
        fontSize: 24.0,
        fontFamily: 'Poppins.ExtraBold',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),),
        ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CalendarPage(),
            ],
          ),
        ),

      ),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              color: Colors.black, // Changer la couleur du texte du titre
              fontSize: 24, // Changer la taille du texte du titre
              fontWeight: FontWeight.bold, // Changer le poids du texte du titre
            ),
            formatButtonVisible: false,
            leftChevronVisible: false,
            rightChevronVisible: false,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10), // Bordure arrondie
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
                    child: _buildEventsMarker(date, events),
                  ),
                );
              }

              return children.isNotEmpty ? children.first : null;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFFD8DF),
      ),
      width: 20.0,
      height: 20.0,
      child: Center(
        child: Text(
          events.length.toString(),
          style: TextStyle(color: Color(0xFFFF2D55)),
        ),
      ),
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
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    //Action à effectuer lors du clic sur le bouton de recherche
                  },
                ),
                Text('Home', ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today_rounded , color: Color(0xFFf34e3a),),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Planning()),
                    );
                  },
                ),
                Text('Planning', style: TextStyle(color: Color(0xFFf34e3a)),),
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
                IconButton(
                  icon: Icon(Icons.access_time),
                  onPressed: () {
                    //Action à effectuer lors du clic sur le bouton de recherche
                  },
                ),
                Text('Abonnement'),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    //Action à effectuer lors du clic sur le bouton de recherche
                  },
                ),
                Text('Profil'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

