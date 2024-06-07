import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymproconnect_flutter/data/controllers/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/models/register_model.dart';

import 'login.dart';



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
                "Commencer",


                style: TextStyle(
                  fontFamily: 'Poppins.light',
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Color(0xFF252525),
                ),




              ),

              const Text(
                "en envoyant une demande d'inscription ",
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
                        labelText: 'prénom',
                        hintText: 'Prénom',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre prénom';
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
                        labelText: 'Nom',
                        hintText: 'Nom',
                        suffixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre nom';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      onChanged: (value) {

                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
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
                        labelText: 'Numéro de téléphone',
                        hintText: 'Numéro de téléphone',
                        suffixIcon: Icon(Icons.phone_android),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez saisir votre numéro de téléphone';
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
                        labelText: 'E-mail',
                        hintText: 'E-mail',
                        suffixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Veuillez entrer une adresse e-mail valide';
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
                        labelText: 'Adresse',
                        hintText: 'Adresse',
                        suffixIcon: Icon(Icons.location_on),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre adresse';
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
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1, color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1, color: Colors.white),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Date de naissance',
                        hintText: 'Date de naissance',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              // Formater la date au format "aaaa-mm-jj"
                              final formattedDate = "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

                              // Mettre à jour le contrôleur de texte avec la date sélectionnée formatée
                              controller.dateOfBirthController.text = formattedDate;
                            }
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer votre date de naissance';
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
                        labelText: 'Mot de passe sécurisé',
                        hintText: 'Mot de passe',
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez entrer un mot de passe';
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
                          "n cochant la case, vous acceptez nos",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF252525),
                          ),
                        ),
                        Text(
                          "termes ",
                          style: TextStyle(
                            fontSize: 9.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFf34e3a),
                          ),
                        ),
                        Text(
                          "et ",
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
                              password: controller.passwordController.text,
                          status: 1,),context);





                     //   }
                      },
                      child: Text(
                       ' Inscription',
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
                     "Déjà membre ? ",
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
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      "Connexion",
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
