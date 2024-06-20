import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/profil_controller.dart';
import '../../models/update_user_model.dart';

final _updateKey = GlobalKey<FormState>();








class update extends StatefulWidget {
  const update({super.key});

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  final ProfilController controller = Get.find();
  final TextEditingController birthDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    birthDateController.text = controller.user.user?.birthDate?.toString() ?? "";
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Editer le profil',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _updateKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          controller.user.user?.name = value;
                        },
                        controller: TextEditingController(
                          text: controller.user.user?.name.toString() ?? "",
                        ),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffix: Image.asset(
                            'assets/profil.png',
                            width: 25,
                            height: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          controller.user.user?.surname = value;
                        },
                        controller: TextEditingController(
                          text: controller.user.user?.surname.toString() ?? "",
                        ),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffix: Image.asset(
                            'assets/profil.png',
                            width: 25,
                            height: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre prénom';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          controller.user.user?.email = value;
                        },
                        controller: TextEditingController(
                          text: controller.user.user?.email.toString() ?? "",
                        ),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffix: Image.asset(
                            'assets/gmail.png',
                            width: 25,
                            height: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          controller.user.user?.phone = value;
                        },
                        controller: TextEditingController(
                          text: controller.user.user?.phone.toString() ?? "",
                        ),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          prefix: Row(mainAxisSize: MainAxisSize.min, children: [
                            Image.asset(
                              'assets/tunisie.png',
                              width: 24,
                              height: 16,
                            ),
                            VerticalDivider(
                              color: Colors.grey,
                            ),
                          ]),
                          suffix: Image.asset(
                            'assets/téléphone.png',
                            width: 25,
                            height: 25,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Veuillez entrer un numéro de téléphone valide';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        readOnly: true,
                        controller: birthDateController,
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffix: Icon(Icons.calendar_month_outlined,

                              color:Color(0xFFf34e3a)


                          )
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre date de naissance';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (selectedDate != null) {
                            String formattedDate = "${selectedDate.toLocal()}".split(' ')[0];
                            setState(() {
                              birthDateController.text = formattedDate; // Met à jour le contrôleur
                            });
                            controller.user.user?.birthDate = formattedDate; // Met à jour le modèle
                          }
                        },
                      ),

                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          controller.user.user?.adress = value;
                        },
                        controller: TextEditingController(
                          text: controller.user.user?.adress.toString() ?? "",
                        ),
                        style: GoogleFonts.poppins(
                          color: Color(0xFF555555),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFFf34e3a),
                            // Changez la couleur ici
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre adresse';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFf34e3a),
                          minimumSize: Size(285, 49),
                        ),
                        onPressed: () async {
                          if (_updateKey.currentState!.validate()) {
                            _updateKey.currentState!.save();
                            UpdateModel updateData = UpdateModel(
                              name: controller.user.user?.name,
                              surname: controller.user.user?.surname,
                              email: controller.user.user?.email,
                              phone: controller.user.user?.phone,
                              birthDate: controller.user.user?.birthDate,
                              adress: controller.user.user?.adress,
                            );
                            await controller.UpdateProfil(updateData, context);
                          }
                        },
                        child: Text(
                          'Mettre à jour',
                          style: GoogleFonts.poppins(fontSize: 18.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Obx(() {
            return controller.loadUpdate.value
                ? Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
                : SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}







