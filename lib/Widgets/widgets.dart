import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Features/TaskDetailView/Component/statusChangeComp.dart';
import '../Utils/utilis.dart';

Widget raisedTextButton(VoidCallback onPress, String text, Color color) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
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
    autofillHints: <String>[hint],
    maxLines: maxLine,
    onSubmitted: onPress,
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
        hintStyle: const TextStyle(
          color: Colors.white24,
        )),
  );
}

Widget iconButton(Icon icon, VoidCallback onPress, Color color) => IconButton(
      color: color,
      iconSize: 18,
      onPressed: onPress,
      icon: icon,
    );

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
                  color: Theme.of(context).primaryColor,
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

showDialogBox(
    BuildContext context, String title, String message, VoidCallback onPress) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.9),
      title: Text(
        title,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        message,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 10,
            fontWeight: FontWeight.w500),
      ),
      actions: <Widget>[
        raisedTextButton(onPress, "Delete", Theme.of(context).primaryColor),
      ],
    ),
  );
}

showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      backgroundColor: Colors.white,
      shape: const StadiumBorder(),
      elevation: 30,
      padding: const EdgeInsets.all(20),
      content: Text(
        text,
        style: GoogleFonts.aBeeZee(
            color: Theme.of(context).primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
