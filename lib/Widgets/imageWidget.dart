import 'package:flutter/material.dart';

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