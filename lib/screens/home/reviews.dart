import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final _formKey = GlobalKey<FormState>();

class reviews extends StatefulWidget {
  const reviews({super.key});

  @override
  State<reviews> createState() => _reviewsState();
}
final List<Map<String, String>> activitie = [
  {'category': 'Yoga',
    'name': 'Yoga Body Stretching',
    'image': 'assets/yoga.png',
    'description': 'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger read more ',
    'prix':'120 dt'
  },
];
class _reviewsState extends State<reviews> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Stack(
                  children: [
                    Container(
                      width: 393,
                      height: 270,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(activitie.first['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Positioned(
                      left: -160,
                      bottom: -140,
                      child: SizedBox(
                        width: 393,
                        height: 200,
                        child: Text(
                          activitie.first['category']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Color(0xFFF34E3A),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -80,
                      bottom: -150,
                      child: SizedBox(
                        width: 393,
                        height: 200,
                        child: Text(
                          activitie.first['name']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFF8A69C),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => reviews()),
                          );
                        },
                        child: Text(
                          'Reviews',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF555555),
                            fontSize: 15,
                            fontWeight: FontWeight.w700,),
                        ),
                      ),
                    ],
                  ),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Reviews",
                    style: GoogleFonts.dmSans(
                      color: Color(0xFF0C1A30),
                      fontSize: 16,

                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: 0.20,
                    ),),),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      setState(() {
                      //  searchText = value;
                      }
                      );
                    },

                    decoration: InputDecoration(
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      floatingLabelStyle:  GoogleFonts.poppins(color: Colors.black),
                      labelText: 'Search',
                      suffixIcon: Icon(Icons.search),
                      filled:true,
                      fillColor: Color(0xffF7F9FD),
                      labelStyle: GoogleFonts.poppins( color: Colors.black),
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






              ]),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(),
    ); //trainers
  }
}
class CustomBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: [
              SizedBox(height: 10,),
              SizedBox(
                width: 76,
                height: 21,
                child: Text(
                  'Prix',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF838589),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0.13,
                  ),
                ),
              ),
              SizedBox(
                width: 76,
                height: 21,
                child: Text(
                  '120 dt',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFF34E3A),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 0.06,
                  ),
                ),
              ),
            ],
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFf34e3a),
              minimumSize: Size(145, 49),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
            },
            child: Text(
              'Réserver',
              style: GoogleFonts.poppins(fontSize: 18.0, color: Colors.white),
            ),
          ),



        ],
      ),
    );
  }
}

