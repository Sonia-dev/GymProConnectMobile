import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/models/login_model.dart';
import 'package:gymproconnect_flutter/screens/home/register.dart';
import '../../data/controllers/auth_controller.dart';

final _loginKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthController controller = Get.find();
  bool _passwordVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100.h,),
                Image.asset(
                  'assets/logo.png',
                  width: 94,
                  height: 60,
                ),
                Text(
                  "Bienvenue",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF252525),
                    fontSize: 24.sp,
      
                    fontWeight: FontWeight.bold,
                  ),
      
                ),
                Text(
                  "Connectez-vous pour accéder à votre compte",
      
                  style: GoogleFonts.poppins(
                    color: Color(0xFF252525),
                    fontSize: 14.sp,
      
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 100),
                Form(
                  key: _loginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color(0xffF7F9FD),
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14.sp,

                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle:GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14.sp,

                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                          labelText: 'Saisissez votre adresse e-mail',


                          hintText: 'E-mail',
                          suffixIcon: Icon(Icons.email_outlined , color:   Colors.grey,),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer une adresse e-mail';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: !_passwordVisible,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF7F9FD),
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14.sp,

                            fontWeight: FontWeight.normal,
                          ),
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 14.sp,

                            fontWeight: FontWeight.normal,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 1, color: Colors.white),
                          ),
                          labelText: 'Mot de passe',
                          hintText: 'Mot de passe',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color:   Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un mot de passe';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                checkColor: Colors.deepOrange,
                                fillColor: MaterialStateProperty.all(Colors.white),
                                side: MaterialStateBorderSide.resolveWith((states) {
                                  if(states.contains(MaterialState.selected)){
                                    return const BorderSide(color: Colors.deepOrange);
                                  } else {
                                    return const BorderSide(color: Color(0xFFCBCBCB));
                                  }
                                }),

                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                              ),
                              Text(
                                "Mémorisez",

                                style: GoogleFonts.poppins(
                                  color: Color(0xFF252525),
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),


                          TextButton(
                            onPressed: () {
                              // Navigate to forget password screen
                            },
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(fontSize: 10.0, color: Color(0xFFff3951),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFff3951),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFf34e3a),
                          minimumSize: Size(MediaQuery.of(context).size.width, 49),
                        ),
                        onPressed: () async {
                          if (_loginKey.currentState!.validate()) {
                            _loginKey.currentState!.save();
                            await controller.login(
                              LoginRequest(
                                email: controller.emailController.text,
                                password: controller.passwordController.text,
                              ),
                              context,
                            );
                            FocusScope.of(context)
                                .unfocus();
                          }
                        },
                        child: Text(
                          'Connexion',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 29.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    Text(
                      "Nouveau membre ?",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF252525),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
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
                        "Inscrivez-vous",
      
                        style: GoogleFonts.poppins(
                          color: Color(0xFFff3951),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
      
      
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
