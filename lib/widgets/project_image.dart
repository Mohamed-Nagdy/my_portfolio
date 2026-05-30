import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/project.dart';

/// Renders a project image from a bundled asset or a remote URL transparently.
class ProjectImage extends StatelessWidget {
  const ProjectImage(this.path, {super.key, this.fit = BoxFit.cover});

  final String path;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (isAssetImage(path)) {
      return Image.asset(
        path,
        fit: fit,
        errorBuilder: (_, __, ___) => const SizedBox.shrink(),
      );
    }
    return CachedNetworkImage(
      imageUrl: path,
      fit: fit,
      errorWidget: (_, __, ___) => const SizedBox.shrink(),
    );
  }
}
