


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

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
                child: imagePath.startsWith('http')
                    ? Image.network(
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
                )
                    : Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
                  width: double.infinity,
                  height: double.infinity, // Set the height to infinity to fill the circle
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
              borderRadius: BorderRadius.circular(70.w),
                child:  imagePath.startsWith('http')
                    ? Image.network(
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
                )
                    : Image.asset(
                  imagePath,
                  fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
                  width: double.infinity,
                  height: double.infinity, // Set the height to infinity to fill the circle
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

Widget customWidget({required String imagePath, required String name, required String title, required double starRating}) {
  int fullStars = starRating.floor(); // Partie entière du rating
  double fraction = starRating - fullStars; // Partie décimale du rating
  List<Widget> starIcons = []; // Liste des icônes d'étoiles

  for (int i = 0; i < fullStars; i++) {
    starIcons.add(Icon(
      Icons.star,
      color: Color(0xFFf34e3a),    ));
  }

  if (fraction > 0) {
    starIcons.add(Icon(
      Icons.star_half,
      color: Color(0xFFf34e3a),
    ));
  }
  for (int i = fullStars + (fraction > 0 ? 1 : 0); i < 5; i++) {
    starIcons.add(Icon(
      Icons.star_border,
      color: Color(0xFFf34e3a),
    ));
  }

  return Row(
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Color(0xffE1E1E1), // Couleur de la bordure
            width: 2, // Largeur de la bordure
          ),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            foregroundColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFF170F49),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF6E6B8F),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
               //   overflow: TextOverflow.ellipsis,

                ),
              ),
              SizedBox(height: 5),
              Row(
                children: starIcons, // Utiliser la liste des icônes d'étoiles
              ),
            ],
          ),
        ),
      ),
    ],
  );
}



Widget buildCircleAvatarPhone({required String imagePath, required String name, required String title,
required String phoneNumber}) {
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
              borderRadius: BorderRadius.circular(70.w),
              child:  imagePath.startsWith('http')
                  ? Image.network(
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
              )
                  : Image.asset(
                imagePath,
                fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
                width: double.infinity,
                height: double.infinity, // Set the height to infinity to fill the circle
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
      Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1), // Green overlay
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(Icons.phone, color: Colors.green),
          onPressed: () {
            launch('tel:$phoneNumber');
          },
        ),
      ),
    ],
  );
}











// Widget buildCircleAvatarPhone({
//   required String imagePath,
//   required String name,
//   required String title,
//   //required String phoneNumber
// }) {
//   return Row(
//
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             margin:  EdgeInsets.symmetric(vertical: 12.h),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//               border: Border.all(
//                 color: Color(0xffE1E1E1), // Border color
//                 width: 2.w, // Border width
//               ),
//             ),
//             child: AspectRatio(
//               aspectRatio: 1,
//               child: CircleAvatar(
//                 radius: 70.w,
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.transparent,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(70.w),
//                   child:  imagePath.startsWith('http')
//                       ? Image.network(
//                     imagePath,
//                     fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
//                     width: double.infinity,
//                     height: double.infinity, // Set the height to infinity to fill the circle
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) {
//                         return child;
//                       }
//                       return Center(
//                         child: SpinKitDoubleBounce(
//                           size: 10,
//                           color: Colors.orange,
//                         ),
//                       );
//                     },
//                   )
//                       : Image.asset(
//                     imagePath,
//                     fit: BoxFit.cover, // Use BoxFit.cover to fill the circle
//                     width: double.infinity,
//                     height: double.infinity, // Set the height to infinity to fill the circle
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     color: Color(0xFF170F49),
//                     fontSize: 18,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 5.h.verticalSpace,
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Color(0xFF6E6B8F),
//                     fontSize: 15,
//                     fontFamily: 'Poppins',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//
//
//       // IconButton(
//       //   icon: Icon(Icons.phone),
//       //   onPressed: () {
//       //     launch('tel:${phoneNumber}');
//       //
//       //   },
//       // ),
//     ],
//   );
// }


