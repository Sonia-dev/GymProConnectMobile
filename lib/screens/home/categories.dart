import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gymproconnect_flutter/data/controllers/categories_controller.dart';
import 'package:gymproconnect_flutter/data/repository/categories_repo.dart';

import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

import '../../data/api/api_client.dart';
import 'filtre.dart';


class CategoriesList extends GetView<CategoriesController> {
  String searchText = '';


  @override
  Widget build(BuildContext context) {
    Get.put(ApiClient(appBaseUrl: "http://172.16.51.9:8000/api/"));
    Get.put(CategoriesRepo( apiClient: Get.find(),));
    Get.put(CategoriesController(categoriesRepo: Get.find()));

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
          style: GoogleFonts.poppins(
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Expanded(
                    /* child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),*/
                    child:TextFormField(
                        onChanged: (value) {

                            searchText = value;

                        },

                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                          labelText: 'Search',
                          suffixIcon: Icon(Icons.search),
                          filled:true,
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
                        )






                    ),
                  ),

                  IconButton(
                    icon: ImageIcon(
                      AssetImage('assets/filtre.png'),
                      size: 24,

                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => filtre()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  itemCount: Get.find<CategoriesController>().categoriesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = Get.find<CategoriesController>().categoriesList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 150,
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                                child:  Image.network(
                                  category.image!,
                                  width: double.infinity,
                                  height: 150,
                                  fit:  BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SizedBox(child: Image.asset("assets/no_image.jpg"));
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress?.expectedTotalBytes ==
                                        loadingProgress?.cumulativeBytesLoaded) {
                                      return child;
                                    }
                                    return const CircularProgressIndicator();
                                  },
                                )
                            ),


                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            category.description!,
                                            style: TextStyle(color: Colors.white),
                                            overflow: TextOverflow.ellipsis, // Gère le débordement du texte
                                          ),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),]),),
      //  bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}