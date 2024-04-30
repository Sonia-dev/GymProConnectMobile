import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/auth_controller.dart';
import 'package:gymproconnect_flutter/home/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';



final _registerKey = GlobalKey<FormState>();




class Register extends GetView<AuthController> {

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
              const SizedBox(height: 100),
              Image.asset(
                'assets/logo.png',
                width: 94,
                height: 60,
              ),
              const SizedBox(height: 10),
              const Text(
                "Get Started",


                style: TextStyle(
                  fontFamily: 'Poppins.light',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Color(0xFF252525),
                ),




              ),

              const Text(
                "by creating a free account ",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'Poppins.light',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF252525),
                ),
              ),
              const SizedBox(height: 30),
              Form(
                key: _registerKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.NameController,

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

                        border: OutlineInputBorder(),
                        labelText: 'name',
                        hintText: 'Name',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.surNameController,
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

                        border: OutlineInputBorder(),
                        labelText: 'Surname',
                        hintText: 'Surname',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your surname';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      onChanged: (value) {

                      },
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

                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Phone Number',
                        suffixIcon: Icon(Icons.phone_android),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.emailController,
                      onChanged: (value) {

                      },
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
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.adressController,

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
                        border: OutlineInputBorder(),
                        labelText: 'Address',
                        hintText: 'Address',
                        suffixIcon: Icon(Icons.location_on),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your date of birth';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.dateOfBirthController,

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
                        border: OutlineInputBorder(),
                        labelText: 'date of birth',
                        hintText: 'DateOfBirth',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                          },
                        ),
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your date of birth';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

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
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _check, onChanged: (bool? value) {  },

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
                        backgroundColor: Color(0xFFf34e3a),
                        minimumSize: Size(285, 49),
                      ),
                      onPressed: () async {
                      if (_registerKey.currentState!.validate()) {
                        _registerKey.currentState!.save();
                      }



                          await controller.register(UserRequest(
                              name: controller.NameController.text,
                              surName: controller.surNameController.text,
                              number: controller.phoneNumberController.text,
                              email: controller.emailController.text,
                              adress: controller.adressController.text,
                              dateOfBirth: controller.dateOfBirthController.text,
                              password: controller.passwordController.text,),context);





                     //   }
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
