import '../gen/assets.gen.dart';

enum Skills {
  flutter,
  dart,
  android,
  ios,
  java,
  kotlin,
  swiftui,
  firebase,
  restfulAPI,
  responsiveDesigns,
  javascript,
  typescript,
  nodejs,
  express,
  socketio,
  mongodb,
  postgresql,
  mysql,
  git,
  github,
  html,
  css,
  bootstrap,
  jquery;

  String get name {
    switch (this) {
      case flutter:
        return 'Flutter';
      case dart:
        return 'Dart';
      case android:
        return 'Android';
      case ios:
        return 'iOS';
      case java:
        return 'Java';
      case kotlin:
        return 'Kotlin';
      case swiftui:
        return 'SwiftUI';
      case firebase:
        return 'Firebase';
      case restfulAPI:
        return 'RESTful API';
      case responsiveDesigns:
        return 'Responsive Designs';
      case javascript:
        return 'JavaScript';
      case typescript:
        return 'TypeScript';
      case nodejs:
        return 'NodeJS';
      case express:
        return 'Express';
      case socketio:
        return 'Socket.IO';
      case mongodb:
        return 'MongoDB';
      case postgresql:
        return 'PostgreSQL';
      case mysql:
        return 'MySQL';
      case git:
        return 'Git';
      case github:
        return 'GitHub';
      case html:
        return 'HTML';
      case css:
        return 'CSS';
      case Skills.bootstrap:
        return 'Bootstrap';
      case Skills.jquery:
        return 'jQuery';
    }
  }

  String get image {
    switch (this) {
      case flutter:
        return Assets.skills.flutter.path;
      case dart:
        return Assets.skills.dart.path;
      case android:
        return Assets.skills.android.path;
      case ios:
        return Assets.skills.ios.path;
      case java:
        return Assets.skills.java.path;
      case kotlin:
        return Assets.skills.kotlin.path;
      case swiftui:
        return Assets.skills.swiftui.path;
      case firebase:
        return Assets.skills.firebase.path;
      case restfulAPI:
        return Assets.skills.restapi.path;
      case responsiveDesigns:
        return Assets.skills.responsive.path;
      case javascript:
        return Assets.skills.javascript.path;
      case typescript:
        return Assets.skills.typescript.path;
      case nodejs:
        return Assets.skills.nodejs.path;
      case express:
        return Assets.skills.expressjs.path;
      case socketio:
        return Assets.skills.socketio.path;
      case mongodb:
        return Assets.skills.mongodb.path;
      case postgresql:
        return Assets.skills.postgresql.path;
      case mysql:
        return Assets.skills.mysql.path;
      case git:
        return Assets.skills.git.path;
      case github:
        return Assets.skills.github.path;
      case html:
        return Assets.skills.html.path;
      case css:
        return Assets.skills.css.path;
      case bootstrap:
        return Assets.skills.bootstrap.path;
      case jquery:
        return Assets.skills.jquery.path;
    }
  }
}
