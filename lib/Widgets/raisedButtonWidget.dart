import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget raisedTextButton(
    VoidCallback onPress, String text, Color color, BuildContext context) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30)),
    child: Text(
      text,
      style: GoogleFonts.aBeeZee(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 15,
          fontWeight: FontWeight.w300),
    ),
  );
}