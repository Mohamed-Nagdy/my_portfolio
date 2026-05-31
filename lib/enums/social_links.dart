import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialLinks {
  github,
  linkedin;

  String get link {
    switch (this) {
      case github:
        return 'https://github.com/Mohamed-Nagdy';
      case linkedin:
        return 'https://www.linkedin.com/public-profile/settings?trk=d_flagship3_profile_self_view_public_profile';
    }
  }

  IconData get icon {
    switch (this) {
      case github:
        return FontAwesomeIcons.github.data;
      case linkedin:
        return FontAwesomeIcons.linkedin.data;
    }
  }

  Color? get color {
    switch (this) {
      case github:
        return null;
      case linkedin:
        return Colors.blue;
    }
  }
}
