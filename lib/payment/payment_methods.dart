import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
final _formKey = GlobalKey<FormState>();

class payment_methods extends StatefulWidget {
  const payment_methods({super.key});

  @override
  State<payment_methods> createState() => _payment_methodsState();
}

class _payment_methodsState extends State<payment_methods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods',
        style: TextStyle(
          color: Color(0xFF181D27),
          fontSize: 14,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
          height: 0.10,
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
        body:
    Container(
    margin: EdgeInsets.only(top: 40, bottom: 30),

      child:Padding(
          padding: EdgeInsets.all(16.0),

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      Text(

        'Payment Methods',
        style: TextStyle(
          color: Color(0xFF202020),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          height: 0,
        ),
      ),
      SizedBox(height: 50,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          minimumSize: Size(343, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color(0xFFE8E8E8),
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              'Payer en espèces',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF555555),
              ),
            ),
            SizedBox(width: 120),
            IconButton(
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône
              },
              icon: Icon(Icons.arrow_forward_ios,   color: Color(0xFF555555),),
            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      ElevatedButton(
        style: ElevatedButton.styleFrom( elevation: 0,
          backgroundColor: Colors.white,
          minimumSize: Size(343, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color(0xFFE8E8E8),
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Image.asset('assets/masterCard.png',
              width: 30,
              height: 24,),
            SizedBox(width: 5,),

            Text(
              'Master Card',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF555555),
              ),
            ),
            SizedBox(width: 120),
            IconButton(
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône
              },
              icon: Icon(Icons.arrow_forward_ios,   color: Color(0xFF555555),),            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          minimumSize: Size(343, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color(0xFFE8E8E8),
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/visa.png',
              width: 30,
              height: 24,),
            SizedBox(width: 5,),

            Text(
              'Visa',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF555555),
              ),
            ),
            SizedBox(width: 120),
            IconButton(
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône
              },
              icon: Icon(Icons.arrow_forward_ios,   color: Color(0xFF555555),),            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          minimumSize: Size(343, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Color(0xFFE8E8E8),
              width: 1,
            ),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState != null && _formKey.currentState!.validate()) {
            _formKey.currentState!.save();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Image.asset('assets/E-Dinar.webp',
              width: 30,
              height: 24,),
            SizedBox(width: 5,),
            Text(
              'E-dinars',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFF555555),
              ),
            ),
            SizedBox(width: 120),
            IconButton(
              onPressed: () {
                // Action à effectuer lors de l'appui sur l'icône
              },
              icon: Icon(Icons.arrow_forward_ios,   color: Color(0xFF555555),),
            ),
          ],
        ),
      ),

    ]
    ),
        ),
    ),
    );
  }
}
