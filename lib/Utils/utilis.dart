import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inputDecorationTextField = InputDecoration(
  focusColor: const Color.fromARGB(255, 28, 28, 28),
  border: OutlineInputBorder(
    borderSide: const BorderSide(
        color: const Color.fromARGB(255, 28, 28, 28), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(
        color: const Color.fromARGB(255, 28, 28, 28), width: 5.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(
        color: const Color.fromARGB(255, 28, 28, 28), width: 1.0),
    borderRadius: BorderRadius.circular(15.0),
  ),
  fillColor: const Color.fromARGB(255, 28, 28, 28),
  filled: true,
  hintStyle: GoogleFonts.aBeeZee(
      color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
);
