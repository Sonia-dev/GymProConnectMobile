import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/activities.dart';
import 'package:gymproconnect_flutter/home/create_account.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:gymproconnect_flutter/home/main_home.dart';
import 'package:gymproconnect_flutter/home/planning.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainHome(),
    );
  }
}
