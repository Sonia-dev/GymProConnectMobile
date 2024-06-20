import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Si vous utilisez flutter_screenutil pour la gestion des tailles d'écran

class ReviewCard extends StatelessWidget {
  final String? comment;
  final String? rating;

  ReviewCard({this.comment, this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color(0xffF7F9FD),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment ?? "__",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            _buildRatingStars(),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    // Parse the rating string to double
    double parsedRating = double.tryParse(rating ?? '0.0') ?? 0.0;

    // Calculate full stars and fraction
    int fullStars = parsedRating.floor();
    double fraction = parsedRating - fullStars;

    // Build the list of star icons
    List<Widget> starIcons = [];
    for (int i = 0; i < fullStars; i++) {
      starIcons.add(Icon(
        Icons.star,
        color: Color(0xFFf34e3a),
        size: 20.0,
      ));
    }

    if (fraction > 0) {
      starIcons.add(Icon(
        Icons.star_half,
        color: Color(0xFFf34e3a),
        size: 20.0,
      ));
    }

    for (int i = fullStars + (fraction > 0 ? 1 : 0); i < 5; i++) {
      starIcons.add(Icon(
        Icons.star_border,
        color: Color(0xFFf34e3a),
        size: 20.0,
      ));
    }

    return Row(
      children: starIcons,
    );
  }
}
