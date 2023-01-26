
import 'package:flutter/material.dart';
import 'package:fluttertask/Widgets/raisedButtonWidget.dart';
import 'package:google_fonts/google_fonts.dart';

showDialogBox(
    BuildContext context, String title, String message, VoidCallback onPress) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.9),
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(
            color: Colors.teal, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      content: Text(
        message,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 10,
            fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: raisedTextButton(
              onPress, "Delete", Theme.of(context).primaryColor, context),
        ),
      ],
    ),
  );
}
