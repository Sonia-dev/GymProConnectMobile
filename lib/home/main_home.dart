import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/activities.dart';
import 'package:gymproconnect_flutter/home/planning.dart';


class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String searchText = '';

  List<Map<String, String>> categories = [
    {'name': ' yoga', 'image': 'assert/yoga.png'},
    {'name': ' Swimming', 'image': 'assert/swimming.png'},
    {'name': ' gymnastique', 'image': 'assert/gymnastique.png'},
   // {'name': '4', 'image': 'assert/bodyCombat.jpg'},
   //{'name': ' 5', 'image': 'assert/bodyCombat.jpg'},
   // {'name': ' 6', 'image': 'assert/bodyCombat.jpg'},
    //{'name': ' 7', 'image': 'assert/bodyCombat.jpg'},
  ];

  List<Map<String, String>> activities = [
    {'name': 'bodypump', 'image': 'assert/swimming.png', 'description': 'Training for beginner'},
   // {'name': '2', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
   // {'name': '3', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    //{'name': '4', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    //{'name': '5', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    //{'name': '6', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    //{'name': '7', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
  ];
  List<Map<String, String>> trainers = [
      {'name': ' Ahmed', 'image': 'assert/ahmed.png'},
    {'name': ' Ali', 'image': 'assert/bodyCombat.jpg'},
    {'name': ' Anis', 'image': 'assert/bodyCombat.jpg'},
    {'name': '4', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
   // {'name': ' 5', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
   // {'name': ' 6', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
    //{'name': ' 7', 'image': 'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'},
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<String> weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July',
      'August', 'September', 'October', 'November', 'December'
    ];
    String dayOfWeek = weekdays[now.weekday - 1];
    String dayOfMonth = now.day.toString();
    String month = months[now.month - 1];
    String year = now.year.toString();

    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 45, bottom: 15),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "welcome Ahmed !",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '$dayOfWeek, $dayOfMonth $month $year',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFFf34e3a),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  }
                  );
                  },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search...',
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categorie',
                    style: TextStyle(fontSize:18.0,fontWeight:FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Action lorsque le bouton "See All" est pressé
      },
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var category in categories)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 54.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(category['image']!),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              category['name'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Activities",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'choose your program',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF545454),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextButton(

                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ActivityList()),
                        );

                    },
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var activity in activities)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 300.0,
                          height: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            shape: BoxShape.rectangle,
                            color: Colors.black12,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  activity['image']!,
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.black12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  activity['description']!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trainers",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'choose your Trainer',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF545454),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
    // Action lorsque le bouton "See All" est pressé
      },
                    child: Text(
                      'See All',
                      style: TextStyle(fontSize: 18.0, color: Color(0xFFf34e3a)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 60.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var trainer in trainers)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                width: 54.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(trainer['image']!),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              trainer['name'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      bottomNavigationBar: CustomBottomAppBar(), // Ajout de la barre de navigation en bas
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
                  icon: Icon(Icons.home, color: Color(0xFFf34e3a)),
                  onPressed: () {
                    //Action à effectuer lors du clic sur le bouton de recherche
                  },
                ),
                Text('Home', style: TextStyle(color: Color(0xFFf34e3a)), ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.calendar_today_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Planning()),
                    );
                  },
                ),
                Text('Planning'),
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

