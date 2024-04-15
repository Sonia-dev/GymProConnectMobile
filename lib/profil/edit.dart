import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/home/Profil.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Map<String, dynamic> Profil = {'name': 'Ahmed','email': 'Itunuoluwa Abidoye@yahoo.fr','number':'99654753','dateofbirth':"21/02/2000" ,'image': 'assert/yoga.png','gender':"female"};
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',style: GoogleFonts.poppins(
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
      body: Center(
        child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: 20),
          Container(
              width: 101.0,
              height: 101.0,
              padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF34E3A),
            ),
              child: Container(
                width: 97.0,
                height: 97.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
            child:CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  Profil['image']!,
                ),
                backgroundColor: Colors.transparent,
              ),

              ),
          ),
                Text('change Picture', style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Profil['name']  = value;
                    });
                  },
                  controller: TextEditingController(
                    text: Profil['name'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                    decoration: InputDecoration(

                      suffix: Image.asset('assert/profil.png',
                        width: 25,
                        height: 20,),),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Profil['email']  = value;
                    });
                  },
                  controller: TextEditingController(
                    text: Profil['email'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    suffix: Image.asset('assert/gmail.png',
                      width: 25,
                      height: 20,),),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Profil['number']  = value;
                    });
                  },
                  controller: TextEditingController(
                    text: Profil['number'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Image.asset(
                      'assert/tunisie.png',
                      width: 24,
                      height: 16,
                    ),
                    VerticalDivider(
                        color: Colors.grey,
                    ),
                    ]),
                       suffix: Image.asset('assert/téléphone.png',
                      width: 25,
                      height: 25,),
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      Profil['dateofbirth']  = value;
                    });
                  },
                  controller: TextEditingController(
                    text: Profil['dateofbirth'],
                  ),
                  style: GoogleFonts.poppins(
                    color: Color(0xFF555555),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,                  ),
                  decoration: InputDecoration(

                    suffix: Image.asset('assert/calendrie.png',
                      width: 25,
                      height: 20,),),
                ),
                SizedBox(height: 10,),
          Container(
            width: 400,
              child:DropdownButton<String>(
                onChanged: (String? newValue) {
              setState(() {
                Profil['gender'] = newValue!;
              });
            },

            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(

                value: value,
                child: Text(value),
              );
            }).toList(),
          ),),
                SizedBox(height: 20,),
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
                    'update profil',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
          ]

          ),
        ),
      ),
    );
  }
}
