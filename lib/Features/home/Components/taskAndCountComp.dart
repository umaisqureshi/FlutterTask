
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget taskAndCountWidget(int total, int completed, double percentage) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              "Daily Plan",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Almost Done",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$completed of ${total} completed",
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        const SizedBox(
          width: 80,
        ),
        CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 15.0,
          animation: true,
          percent: (percentage / 100).isNaN ? 0.0 : percentage / 100,
          center: Text(
            percentage.isNaN ? "0%" : "${percentage.floor()}%",
            style: GoogleFonts.aBeeZee(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          progressColor: Colors.white,
          circularStrokeCap: CircularStrokeCap.round,
        )
      ],
    ),
  );
}
