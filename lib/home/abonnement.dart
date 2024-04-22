import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/home/planning.dart';

class abonnement extends StatefulWidget {
  const abonnement({super.key});

  @override
  State<abonnement> createState() => _abonnementState();
}

class _abonnementState extends State<abonnement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    icon: Icon(Icons.calendar_today_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Planning()),
                      );
                    },
                  ),
                ),
                Text('Planning', style: TextStyle(fontSize: 12),),
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
                    icon: Icon(Icons.access_time, color: Color(0xFFf34e3a)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => abonnement()),
                      );
                    },
                  ),
                ),

                Text('Abonnement',style: TextStyle(color: Color(0xFFf34e3a),fontSize: 12),),
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

