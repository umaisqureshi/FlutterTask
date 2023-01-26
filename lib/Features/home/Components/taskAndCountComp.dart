import 'package:flutter/material.dart';
import 'package:fluttertask/Widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget taskAndCountWidget(int total, int completed, double percentage,
    VoidCallback onPress, BuildContext context) {
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
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Almost Done",
              style: GoogleFonts.aBeeZee(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$completed of ${total} completed",
              style: GoogleFonts.aBeeZee(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: onPress,
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.onBackground),
                child: Text(
                  "Export Csv",
                  style: GoogleFonts.aBeeZee(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )),
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
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          progressColor: Colors.white,
          circularStrokeCap: CircularStrokeCap.round,
        )
      ],
    ),
  );
}
