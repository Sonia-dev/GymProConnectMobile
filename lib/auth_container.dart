import 'package:flutter/cupertino.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';

class AuthContainer extends StatefulWidget {
  const AuthContainer({super.key});

  @override
  State<AuthContainer> createState() => _AuthContainerState();
}

class _AuthContainerState extends State<AuthContainer> {
  @override
  Widget build(BuildContext context) {
    //bool IsLoggedIn ;
    if(true)
    return MainHome();
    else
      return login();
  }
}


