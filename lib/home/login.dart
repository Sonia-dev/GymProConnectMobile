import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:gymproconnect_flutter/home/register.dart';
import 'package:gymproconnect_flutter/models/login_model.dart';

import '../data/controllers/auth_controller.dart';




final _loginKey = GlobalKey<FormState>();

class login extends GetView<AuthController> {

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
              Image.asset('assets/logo.png',
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
              TextFormField(

             controller: controller.emailController,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color(0xffF7F9FD),
                  labelStyle: TextStyle( color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(width: 1, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(width: 1, color: Colors.white)),

                  labelText: 'Enter your Email',
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.email_outlined),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
               controller: controller.passwordController,
                obscureText: true,

                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF7F9FD),
                  labelStyle: TextStyle( color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(width: 1, color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      const BorderSide(width: 1, color: Colors.white)),

                  labelText: 'password',
                  hintText: 'password ',
                  suffixIcon: Icon(Icons.lock_outline_rounded),
                  border: OutlineInputBorder(),),

                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },


              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                        _rememberMe = value!;

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
                  backgroundColor: Color(0xFFf34e3a),
                  minimumSize: Size(285, 49),
                ),
                onPressed: () async {
                      // if (_loginKey.currentState!.validate()) {
                      //   _loginKey.currentState!.save();}
            await controller.login(LoginRequest(email: controller.emailController.text, password: controller.passwordController.text,),context);
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
                        MaterialPageRoute(builder: (context) => Register()),
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



