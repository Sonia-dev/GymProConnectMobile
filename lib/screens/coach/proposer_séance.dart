import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymproconnect_flutter/data/repository/activities_repo.dart';
import 'package:gymproconnect_flutter/screens/profil/edit.dart';
import 'package:intl/intl.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:gymproconnect_flutter/data/controllers/proposer_seance_controller.dart';
import 'package:gymproconnect_flutter/models/proposer_seance_model.dart';

import '../../constants/constants.dart';
import '../../data/controllers/activities_controller.dart';

final _proposerKey = GlobalKey<FormState>();

class ProposerSeance extends GetView<ProposerSeanceController> {
  @override
  Widget build(BuildContext context) {

    Get.put(ActivitiesRepo(apiClient: Get.find()));
    Get.put(ActivitiesController(activitiesRepo: Get.find(),));

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Center(child: const Text("Proposer une séance")),


      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Form(
                key: _proposerKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<Object>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        border: OutlineInputBorder(),
                        labelText: 'Activité ',
                        hintText: 'Sélectionnez une activité ',
                      ),
                      items: Get.find<ActivitiesController>()
                          .activitiesList
                          .value
                          .map((activity) {
                        return DropdownMenuItem<Object>(
                          value: activity.id.toString(),
                          child: Text(activity.name.toString()),
                        );
                      }).toList(),
                      onChanged: (v) {
                        controller.activityId = v;
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Veuillez sélectionner une activité';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<Object>(
                      onChanged: (value) {
                        // Handle onChanged event here if needed
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        border: OutlineInputBorder(),
                        labelText: 'Studio ',
                        hintText: 'Sélectionnez un studio ',
                      ),
                      items: [
                        DropdownMenuItem<Object>(
                          value: '1',
                          child: Text('Studio 1'),
                        ),
                        DropdownMenuItem<Object>(
                          value: '2',
                          child: Text('Studio 2'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Veuillez sélectionner un studio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.date,
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _selectDate(context);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        labelText: 'Date',
                        hintText: 'yyyy-mm-dd',
                        suffixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (date) {
                        controller.date =
                        date.toString() as TextEditingController;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner un date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.capacity,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: false, decimal: false),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        border: OutlineInputBorder(),
                        labelText: "Nombre maximum des adhérents",
                        hintText: "Nombre maximum des adhérents",
                        suffixIcon: Icon(Icons.people),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez sélectionner un nombre maximum des adhérents';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.hourStart,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffF7F9FD),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 1, color: Colors.white)),
                        border: OutlineInputBorder(),
                        labelText: 'heure de la séance',
                        hintText: 'HH:mm',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (selectedTime != null) {
                              String formattedTime =
                                  "${selectedTime.hour}:${selectedTime.minute}";
                              controller.hourStart.text = formattedTime;
                            }
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez choisir une heure pour la séance';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 160.h,),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFf34e3a),
                    minimumSize: Size(double.infinity, 49),
                  ),
                  onPressed: () async {
                    if (_proposerKey.currentState!.validate()) {
                      _proposerKey.currentState!.save();
                    }

                    await controller.proposerSeance(
                        ProposerSeanceModel(
                          activity_id: controller.activityId,
                          coach_id: GetStorage().read('userId'),
                          studio_id: "1",
                          date: controller.date.text,
                          capacity: controller.capacity.text,
                          hourStart: controller.hourStart.text,
                        ),
                        context);
                    update();
                  },
                  child: Text(
                    'Proposer',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      controller.date.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }
}
