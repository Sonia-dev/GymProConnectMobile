import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/controllers/filter_controller.dart';


class Filtre extends GetView<FilterController> {
  String _selectedCategory = "All";
  String _selectedGender = "Mixed";
  String _selectedTarget = "All";

  final _formKey = GlobalKey<FormState>();
  RangeValues _selectedPriceRange;

  Filtre() : _selectedPriceRange = RangeValues(0, 500);

  @override
  Widget build(BuildContext context) {
    final categories = Get.find<FilterController>().filter.category;
    final genders = Get.find<FilterController>().filter.gender ?? [];
    final targets = Get.find<FilterController>().filter.target ?? [];
    final priceMinStr = Get.find<FilterController>().filter.prices?.min ?? "0.0";
    final priceMaxStr = Get.find<FilterController>().filter.prices?.max ?? "500.0";


    double priceMin = double.tryParse(priceMinStr) ?? 0.0;
    double priceMax = double.tryParse(priceMaxStr) ?? 500.0;

    _selectedPriceRange = RangeValues(priceMin, priceMax);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filtre',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
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
                child: (categories == null)
                    ? Container()
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length + 1, // Include "All"
                  itemBuilder: (BuildContext context, int index) {
                    final category = index == 0 ? "All" : categories[index - 1];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (bool selected) {
                          _selectedCategory = selected ? category : "";
                          // If another category is selected, deselect "All"
                          if (category != "All") {
                            _selectedCategory = category;
                          }
                          // Update state
                          (context as Element).markNeedsBuild();
                        },
                        selectedColor: category == "All" ? Colors.red : Color(0xFFF34E3A),
                        showCheckmark: false,
                      ),
                    );
                  },
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
              SizedBox(height: 10),
              Stack(
                children: [


                  RangeSlider(
                    values: _selectedPriceRange,
                    min: priceMin,
                    max: priceMax,
                    divisions: 30,
                    onChanged: (values) {
                      _selectedPriceRange = values;
                    },
                    labels: RangeLabels(
                      _selectedPriceRange.start.toStringAsFixed(2),
                      _selectedPriceRange.end.toStringAsFixed(2),
                    ),
                    activeColor: Color(0xFFF34E3A),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_selectedPriceRange.start.toStringAsFixed(2)} DT",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "${_selectedPriceRange.end.toStringAsFixed(2)} DT",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genders.length + 1, // Include "Mixed"
                  itemBuilder: (BuildContext context, int index) {
                    final gender = index == 0 ? "Mixed" : genders[index - 1];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FilterChip(
                        label: Text(gender),
                        selected: _selectedGender == gender,
                        onSelected: (bool selected) {
                          _selectedGender = selected ? gender : "";
                          // If another gender is selected, deselect "Mixed"
                          if (gender != "Mixed") {
                            _selectedGender = gender;
                          }
                          // Update state
                          (context as Element).markNeedsBuild();
                        },
                        selectedColor: gender == "Mixed" ? Colors.red : Color(0xFFF34E3A),
                        showCheckmark: false,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Target",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: targets.length + 1, // Include "All"
                  itemBuilder: (BuildContext context, int index) {
                    final target = index == 0 ? "All" : targets[index - 1];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FilterChip(
                        label: Text(target),
                        selected: _selectedTarget == target,
                        onSelected: (bool selected) {
                          _selectedTarget = selected ? target : "";
                          // If another target is selected, deselect "All"
                          if (target != "All") {
                            _selectedTarget = target;
                          }
                          // Update state
                          (context as Element).markNeedsBuild();
                        },
                        selectedColor: target == "All" ? Colors.red : Color(0xFFF34E3A),
                        showCheckmark: false,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 250.h),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF34E3A),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
