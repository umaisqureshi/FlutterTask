import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/utilis.dart';

Widget textFieldWidget(
    TextEditingController controller,
    String hint,
    int maxLine,
    void Function(String)? onPress,
    BuildContext context,
    int length) {
  return TextField(
    autofillHints: <String>[hint],
    maxLines: maxLine,
    onSubmitted: onPress,
    cursorColor: Theme.of(context).colorScheme.onBackground,
    controller: controller,
    maxLength: length,
    inputFormatters: [
      LengthLimitingTextInputFormatter(length),
    ],
    style: GoogleFonts.aBeeZee(
        color: Theme.of(context).colorScheme.onBackground,
        fontSize: 10,
        fontWeight: FontWeight.bold),
    decoration: inputDecorationTextField.copyWith(
        hintText: hint,
        counterText: "",
        fillColor: Theme.of(context).backgroundColor,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
        )),
  );
}