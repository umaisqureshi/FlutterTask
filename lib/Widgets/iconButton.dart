

import 'package:flutter/material.dart';

Widget iconButton(Icon icon, VoidCallback onPress, Color color) => IconButton(
      color: color,
      iconSize: 18,
      onPressed: onPress,
      icon: icon,
    );
