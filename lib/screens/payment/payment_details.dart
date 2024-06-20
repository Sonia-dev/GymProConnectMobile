import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymproconnect_flutter/screens/payment/payment_methods.dart';
import 'package:intl/intl.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM dd, yyyy').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details',
          style: GoogleFonts.poppins(
            color: Color(0xFF181D27),
            fontSize: 14,
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
      body: Container(
        margin: EdgeInsets.only(top: 40, bottom: 30,right: 10,left: 10),


    child:Padding(
    padding: EdgeInsets.all(16.0),

    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/yoga.png',
              width: 136,
              height: 127,
            ),
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text(
                  'Yoga',
                //  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF34E3A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
                  SizedBox(),
                  Text(
                    '4.6',
                    style: TextStyle(
                      color: Color(0xFF0C1A30),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 0.20,
                    ),
                  ),],),
              SizedBox(height: 10,),
              Text(
                'Yoga Body Stretching',
                style: TextStyle(
                  color: Color(0xFF0C1A30),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              SizedBox(height: 10,),

              Text( '120 dt',
              style: TextStyle(
                color: Color(0xFFF34E3A),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.11,
              ),),
            ],
          )

        ],



      ),
      SizedBox(height:20,),
      Container(
        width: 343,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFD6D5D5),
            ),
          ),
        ),
      ),
      SizedBox(height:20,),
      Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Booking Date",
                style: TextStyle(
      color: Color(0xFF555555),
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      height: 0.12,
    ),
              ),
             Row(children: [
               Text('$formattedDate ',style: TextStyle(
                 color: Colors.black,
                 fontSize: 13,
                 fontFamily: 'Poppins',
                 fontWeight: FontWeight.w500,
                 height: 0.12,
               ),),
               Container(
                 width: 1,
                 height: 22,
                 decoration: ShapeDecoration(
                   shape: RoundedRectangleBorder(
                     side: BorderSide(
                       width: 1,
                       strokeAlign: BorderSide.strokeAlignCenter,
                     ),
                   ),
                 ),
               ),
               Text(' $formattedTime',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 13,
                   fontFamily: 'Poppins',
                   fontWeight: FontWeight.w500,
                   height: 0.12,
                 ),),
             ],)

            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("From",
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),),
              Text('aaaaaa', style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),),

            ],
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("To",
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),),
              Text('April 1, 2022', style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),),

            ],
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Trainer",
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),),
              Text('April 1, 2022', style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),),

            ],
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price",
                style: TextStyle(
                  color: Color(0xFF555555),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),),
              Text('April 1, 2022', style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0.12,
              ),),

            ],
          ),

        ],
      ),
      SizedBox(height: 30,),
      Container(
        width: 343,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFD6D5D5),
            ),
          ),
        ),
      ),
      SizedBox(height: 30,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [Icon(Icons.payment,color: Color(0xffF34E3A),weight: 26,),
              Text('Cash', style: TextStyle(
                color: Color(0xFFF34E3A),
                fontSize: 13,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),),],
          ),
          TextButton( onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => payment_methods()),
            );
          },
            child: Text(
            'Change',
              style: TextStyle(
                color: Color(0xFFF34E3A),
                fontSize: 13,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
          ),
          ),
        ],),
      SizedBox(height: 50,),
      ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFf34e3a),
          minimumSize: Size(285, 49),
        ),
        onPressed: () {

        },
        child: Text('confirmer',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ),
    ]),),
      ),
    );
  }
}
