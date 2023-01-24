import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/utilis.dart';

Widget raisedTextButton(VoidCallback onPress, String text, Color color) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
    child: Text(
      text,
      style: GoogleFonts.aBeeZee(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
    ),
  );
}

Widget imageWidget(String name, double? height) {
  return Image.asset(
    name,
    fit: BoxFit.cover,
    height: height,
  );
}

Widget progressIndicator(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Theme.of(context).colorScheme.background,
      strokeWidth: 2,
    ),
  );
}

Widget textFieldWidget(
    TextEditingController controller,
    String hint,
    int maxLine,
    void Function(String)? onPress,
    BuildContext context,
    int length) {
  return TextField(
    maxLines: maxLine,
    onChanged: onPress,
    maxLength: length,
    style: GoogleFonts.aBeeZee(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 10,
        fontWeight: FontWeight.bold),
    decoration: inputDecorationTextField.copyWith(
      hintText: hint,
    ),
  );
}

Widget iconButton(Icon icon, VoidCallback onPress, Color color) {
  return IconButton(
    color: color,
    iconSize: 18,
    onPressed: onPress,
    icon: icon,
  );
}

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      backgroundColor: Colors.white,
      shape: const StadiumBorder(),
      elevation: 30,
      padding: const EdgeInsets.all(20),
      content: Text(
        text,
        style: GoogleFonts.roboto(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      )));
}
