import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      backgroundColor: Theme.of(context).primaryColor,
      shape: const StadiumBorder(),
      elevation: 30,
      padding: const EdgeInsets.all(20),
      content: Text(
        text,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
