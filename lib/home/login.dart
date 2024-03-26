import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/create_account.dart';

class login extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<login> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String EmailText = '';
  String passwordText = '';
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             Image.asset('assert/logo.png',
             width: 94,height: 60,),
              Text("Welcome back ",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Poppins.ExtraBold',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              Text("sign in to access your account ",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins.light',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              SizedBox(height: 100,),
              TextField(
                onChanged: (value) {
                  setState(() {
                    EmailText = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
          
                  labelText: 'Enter your Email',
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    passwordText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(),
                ),
              ),
                SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState((){
                        _rememberMe = value!;
                      });
                    },
                  ),
                  SizedBox(width: 2,),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: 9.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252525),
                    ),
                  ),
                  SizedBox(width: 150,),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        // Action lorsque le bouton "See All" est pressé<
                      },
                      child: Text(
                        'Forget password    ?',
                        style: TextStyle(fontSize: 9.0,
                            color: Color(0xFFff3951)),
                      ),
                    ),
                  ),
                ],
              ),
                SizedBox(height: 50),
                ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:  Color(0xFFf34e3a),
          
            minimumSize: Size(285, 49),
          
          ),
          
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              // Sign in logic goes here
            }
          },
          
          child: Text('Sign In',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  Text("New Member? ",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252525),
                    ),
                  ),
          
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationForm()),
                      );
                    },
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFff3951),
                      ),
                    ),
                  ),
          
                ],
              ),
          
            ],
          
          ),
        ),
      ),

    );
  }
}