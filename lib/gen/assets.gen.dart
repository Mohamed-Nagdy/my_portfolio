/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/black-white.png
  AssetGenImage get blackWhite =>
      const AssetGenImage('assets/images/black-white.png');

  /// File path: assets/images/colored.png
  AssetGenImage get colored => const AssetGenImage('assets/images/colored.png');

  /// File path: assets/images/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/images/location.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/mobile.png
  AssetGenImage get mobile => const AssetGenImage('assets/images/mobile.png');

  /// File path: assets/images/moon.png
  AssetGenImage get moon => const AssetGenImage('assets/images/moon.png');

  /// File path: assets/images/sun.png
  AssetGenImage get sun => const AssetGenImage('assets/images/sun.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [blackWhite, colored, location, logo, mobile, moon, sun];
}

class $AssetsSkillsGen {
  const $AssetsSkillsGen();

  /// File path: assets/skills/android.png
  AssetGenImage get android => const AssetGenImage('assets/skills/android.png');

  /// File path: assets/skills/bootstrap.png
  AssetGenImage get bootstrap =>
      const AssetGenImage('assets/skills/bootstrap.png');

  /// File path: assets/skills/css.png
  AssetGenImage get css => const AssetGenImage('assets/skills/css.png');

  /// File path: assets/skills/dart.webp
  AssetGenImage get dart => const AssetGenImage('assets/skills/dart.webp');

  /// File path: assets/skills/expressjs.png
  AssetGenImage get expressjs =>
      const AssetGenImage('assets/skills/expressjs.png');

  /// File path: assets/skills/firebase.webp
  AssetGenImage get firebase =>
      const AssetGenImage('assets/skills/firebase.webp');

  /// File path: assets/skills/flutter.png
  AssetGenImage get flutter => const AssetGenImage('assets/skills/flutter.png');

  /// File path: assets/skills/git.png
  AssetGenImage get git => const AssetGenImage('assets/skills/git.png');

  /// File path: assets/skills/github.png
  AssetGenImage get github => const AssetGenImage('assets/skills/github.png');

  /// File path: assets/skills/html.png
  AssetGenImage get html => const AssetGenImage('assets/skills/html.png');

  /// File path: assets/skills/ios.png
  AssetGenImage get ios => const AssetGenImage('assets/skills/ios.png');

  /// File path: assets/skills/java.png
  AssetGenImage get java => const AssetGenImage('assets/skills/java.png');

  /// File path: assets/skills/javascript.png
  AssetGenImage get javascript =>
      const AssetGenImage('assets/skills/javascript.png');

  /// File path: assets/skills/jquery.png
  AssetGenImage get jquery => const AssetGenImage('assets/skills/jquery.png');

  /// File path: assets/skills/kotlin.png
  AssetGenImage get kotlin => const AssetGenImage('assets/skills/kotlin.png');

  /// File path: assets/skills/mongodb.png
  AssetGenImage get mongodb => const AssetGenImage('assets/skills/mongodb.png');

  /// File path: assets/skills/mysql.png
  AssetGenImage get mysql => const AssetGenImage('assets/skills/mysql.png');

  /// File path: assets/skills/nodejs.png
  AssetGenImage get nodejs => const AssetGenImage('assets/skills/nodejs.png');

  /// File path: assets/skills/postgresql.png
  AssetGenImage get postgresql =>
      const AssetGenImage('assets/skills/postgresql.png');

  /// File path: assets/skills/responsive.webp
  AssetGenImage get responsive =>
      const AssetGenImage('assets/skills/responsive.webp');

  /// File path: assets/skills/restapi.png
  AssetGenImage get restapi => const AssetGenImage('assets/skills/restapi.png');

  /// File path: assets/skills/socketio.png
  AssetGenImage get socketio =>
      const AssetGenImage('assets/skills/socketio.png');

  /// File path: assets/skills/swiftui.png
  AssetGenImage get swiftui => const AssetGenImage('assets/skills/swiftui.png');

  /// File path: assets/skills/typescript.png
  AssetGenImage get typescript =>
      const AssetGenImage('assets/skills/typescript.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        android,
        bootstrap,
        css,
        dart,
        expressjs,
        firebase,
        flutter,
        git,
        github,
        html,
        ios,
        java,
        javascript,
        jquery,
        kotlin,
        mongodb,
        mysql,
        nodejs,
        postgresql,
        responsive,
        restapi,
        socketio,
        swiftui,
        typescript
      ];
}

class Assets {
  Assets._();

  static const AssetGenImage hi = AssetGenImage('assets/hi.gif');
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSkillsGen skills = $AssetsSkillsGen();

  /// List of all assets
  static List<AssetGenImage> get values => [hi];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
