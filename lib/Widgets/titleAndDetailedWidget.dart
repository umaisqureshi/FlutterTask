
import 'package:flutter/material.dart';
import 'package:fluttertask/Widgets/textFieldWidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Features/TaskDetailView/Component/statusChangeComp.dart';

Widget titleAndDetailedWidget(
    String title,
    String description,
    BuildContext context,
    Size size,
    bool editable,
    TextEditingController? controller,
    int fieldSize,
    int boxSize) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Row(
          children: [
            Text(
              title,
              style: GoogleFonts.aBeeZee(
                  color: Colors.teal,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              ":",
              style: GoogleFonts.aBeeZee(
                  color: Theme.of(context).primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: size.width * 0.60,
          child: editable && title == "Status"
              ? StatusChangeWidget(
                  selectedStatus: description,
                )
              : editable
                  ? textFieldWidget(controller!, description, fieldSize, (p0) {
                      controller.text = p0;
                    }, context, boxSize)
                  : Text(
                      description,
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
        )
      ],
    ),
  );
}
