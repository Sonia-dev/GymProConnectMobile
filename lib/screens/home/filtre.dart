import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/data/controllers/activity_find_by_name_controller.dart';

import '../../data/api/api_client.dart';
import '../../data/controllers/activities_controller.dart';
import '../../data/repository/activities_repo.dart';

class filtre extends GetView<ActFindByNameController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ApiClient(appBaseUrl: "http://192.168.1.191:8000/api/"));
    Get.put(ActivitiesRepo( apiClient: Get.find(),));
    Get.put(ActivitiesController(activitiesRepo: Get.find()));
    return  Scaffold(
          appBar: AppBar(
            title: Text('Filtre',style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        body: FilterScreen(),

    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedCategory = "All";
  double _target = 150;
  double _price = 30;
  int _rating = 4;
  List<String> _selectedGender = ["mixed"];
  List<String> _selectedAge = ["Adults"];
  // List<Map<String, String>> categories = [
  //   {'name': ' yoga', 'image': 'assets/yoga.png'},
  //   {'name': ' Swimming', 'image': 'assets/swimming.png'},
  //   {'name': ' gymnastique', 'image': 'assets/gymnastique.png'},
  //   {'name': '4', 'image': 'assets/bodyCombat.jpg'},
  //   {'name': ' 5', 'image': 'assets/bodyCombat.jpg'},
  //    {'name': ' 6', 'image': 'assets/bodyCombat.jpg'},
  //   {'name': ' 7', 'image': 'assets/bodyCombat.jpg'},
  // ];
  final _formKey = GlobalKey<FormState>();
  double _minPrice = 0;
  double _maxPrice = 300;


  @override
  Widget build(BuildContext context) {
    final category = Get.arguments;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Category",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  FilterChip(
                    label: Text("All"),
                    selected: _selectedCategory == "All",
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedCategory = selected ? "All" : "";
                      });
                    },
                    selectedColor: Color(0xFFF34E3A),
                    showCheckmark: false,
                  ),

                  /*  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                        children: [
                          FilterChip(
                            label: Text(category.name),
                            selected: _selectedCategory == category.name,
                            onSelected: (bool selected) {
                              setState(() {
                                _selectedCategory = selected ? category.name : "All";
                              });
                            },
                            visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                            selectedColor: Color(0xFFF34E3A),
                            showCheckmark: false,
                          ),
                        ],
                      ),
                    ),*/
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Price Range",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Stack(
              children: [
                RangeSlider(
                  values: RangeValues(_minPrice, _maxPrice),
                  min: 0,
                  max: 300,
                  divisions: 30,
                  onChanged: (values) {
                    setState(() {
                      _minPrice = values.start;
                      _maxPrice = values.end;
                    });
                  },
                  labels: RangeLabels(
                    _minPrice.toStringAsFixed(0) + " DT",
                    _maxPrice.toStringAsFixed(0) + " DT",
                  ),
                  activeColor: Color(0xFFF34E3A), // Changez cette couleur selon votre préférence
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _minPrice.toStringAsFixed(0) + " DT",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      _maxPrice.toStringAsFixed(0) + " DT",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reviews",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [



            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFf34e3a),
                minimumSize: Size(285, 49),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
              },
              child: Text(
                'Apply',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
                  ],
                ),
        ]
      ),
        ]
    ),
    ),
    );
  }
}