import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> launchWhatsapp(String number) async {
  final String url = 'https://wa.me/$number';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  }
}

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
