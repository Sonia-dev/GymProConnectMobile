import 'package:flutter/material.dart';

class ActivityList extends StatefulWidget {
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  final _formKey = GlobalKey<FormState>();
  String searchText = '';
  List<Map<String, String>> activities = [
    {
      'name': 'bodypump',
      'image': 'assert/yoga.png',
      'description': 'Training for beginner',
    },
    {'name': '2', 'image': 'assert/bodyCombat.jpg', 'description': 'Training for beginner'},
    {'name': '3', 'image': 'assert/bodypump.jpg', 'description': 'Training for beginner'},
    {'name': '4', 'image': 'assert/gymnastique.png', 'description': 'Training for beginner'},
    {'name': '5', 'image': 'assert/rpm.jpg', 'description': 'Training for beginner'},
    {'name': '6', 'image': 'assert/swimming.png', 'description': 'Training for beginner'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action à effectuer lorsqu'on appuie sur le bouton de retour
          }, 
        ),
        title: Center(
          child: Text('Activities'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Search...',
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_list_alt),
                  onPressed: () {
                    // Action à effectuer lorsque l'utilisateur appuie sur l'icône de filtre
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (BuildContext context, int index) {
                  final activity = activities[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: 150, // Définir une hauteur fixe pour chaque conteneur d'activité
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              activity['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 150,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Colors.black54,
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                activity['description']!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
                    // Action à effectuer lors du clic sur le bouton de recherche
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