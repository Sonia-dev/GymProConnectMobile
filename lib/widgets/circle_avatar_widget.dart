


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget buildCircleAvatar({required String imagePath, required String text}) {
  return Column(
    children: [
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Color(0xffE1E1E1), // Border color
              width: 2.w, // Border width
            ),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: CircleAvatar(
              radius: 70.w,
              backgroundColor: Colors.white,
              foregroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70.w), // Match the CircleAvatar's radius
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
                  width: double.infinity,
                  height: double.infinity, // Set the height to infinity to fill the circle
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: SpinKitDoubleBounce(
                        size: 10,
                        color: Colors.orange,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 12.spMax,
          color: Color(0xff091D60),
          height: 1.20,
        ),
      ),
    ],
  );
}
Widget buildCircleAvatarhor({required String imagePath, required String name, required String title}) {
  return Row(

    children: [
      Container(
        margin:  EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Color(0xffE1E1E1), // Border color
            width: 2.w, // Border width
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: CircleAvatar(
            radius: 70.w,
            backgroundColor: Colors.white,
            foregroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70.w), // Match the CircleAvatar's radius
              child: Image.network(
                imagePath,
                fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
                width: double.infinity,
                height: double.infinity, // Set the height to infinity to fill the circle
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SpinKitDoubleBounce(
                      size: 10,
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF170F49),
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
            5.h.verticalSpace,
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF6E6B8F),
                fontSize: 15,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}




