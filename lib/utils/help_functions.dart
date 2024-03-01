import 'package:flutter/material.dart';

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

List<BoxShadow> shadow() {
  return const [
    BoxShadow(
      color: Color(0x193A3541),
      blurRadius: 10,
      offset: Offset(0, 2),
      spreadRadius: 0,
    )
  ];
}
