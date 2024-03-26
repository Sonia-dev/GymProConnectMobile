import 'package:flutter/material.dart';
import 'package:gymproconnect_flutter/home/login.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String number = "";
  String password = "";
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Image.asset(
                'assert/logo.png',
                width: 94,
                height: 60,
              ),
              SizedBox(height: 10),
              Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Poppins.ExtraBold',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              Text(
                "by creating a free account ",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins.light',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full name',
                        hintText: 'Name',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Valid email',
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          number = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone number',
                        hintText: 'Number',
                        suffixIcon: Icon(Icons.phone_android),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Strong Password',
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _check,
                          onChanged: (value) {
                            setState(() {
                              _check = value!;
                            });
                          },
                        ),
                        Text(
                          "By checking the box you agree to our ",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF252525),
                          ),
                        ),
                        Text(
                          "Terms ",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFf34e3a),
                          ),
                        ),
                        Text(
                          "and ",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF252525),
                          ),
                        ),
                        Text(
                          "Conditions ",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFf34e3a),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFf34e3a),
                        minimumSize: Size(285, 49),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Sign in logic goes here
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member? ",
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
                        MaterialPageRoute(builder: (context) => login()),
                      );
                    },
                    child: Text(
                      "Log In",
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