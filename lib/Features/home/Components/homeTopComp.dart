import 'package:flutter/material.dart';
import 'package:fluttertask/Features/home/model/tasksModel.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/widgets.dart';

homeTopWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Card(
                  shape: const StadiumBorder(),
                  elevation: 5,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: imageWidget("assets/umais.jpeg", 80))),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Umais Qureshi",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Flutter Developer",
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 10,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                onPressed: (() {}),
                icon: Icon(
                  Icons.notifications_on,
                  color: Theme.of(context).colorScheme.onBackground,
                ))
          ],
        )
      ],
    ),
  );
}
