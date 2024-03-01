import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialLinks {
  github,
  linkedin,
  hackerrank,
  twitter,
  facebook,
  whatsapp;

  String get link {
    switch (this) {
      case github:
        return 'https://github.com/Mohamed-Nagdy';
      case linkedin:
        return 'https://www.linkedin.com/public-profile/settings?trk=d_flagship3_profile_self_view_public_profile';
      case hackerrank:
        return 'https://www.hackerrank.com/profile/mohamednagdy257';
      case twitter:
        return 'https://twitter.com/Mohamed60276267';
      case facebook:
        return 'https://www.facebook.com/profile.php?id=100011430643963';
      case whatsapp:
        return 'https://api.whatsapp.com/send/?phone=201558400064';
    }
  }

  IconData get icon {
    switch (this) {
      case github:
        return FontAwesomeIcons.github;
      case linkedin:
        return FontAwesomeIcons.linkedin;
      case hackerrank:
        return FontAwesomeIcons.hackerrank;
      case twitter:
        return FontAwesomeIcons.twitter;
      case facebook:
        return FontAwesomeIcons.facebook;
      case whatsapp:
        return FontAwesomeIcons.whatsapp;
    }
  }

  Color? get color {
    switch (this) {
      case github:
        return null;
      case linkedin:
        return Colors.blue;
      case hackerrank:
        return Colors.green;
      case twitter:
        return Colors.blue;
      case facebook:
        return Colors.blue;
      case whatsapp:
        return Colors.green;
    }
  }
}
