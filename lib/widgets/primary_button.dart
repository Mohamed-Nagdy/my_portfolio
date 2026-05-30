import 'package:flutter/material.dart';

import 'buttons.dart';

/// Compatibility wrapper around [GradientButton] for existing call sites.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    super.key,
    this.onTap,
    this.width,
  });
  final void Function()? onTap;
  final String title;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      label: title,
      dense: true,
      expand: width == double.infinity,
      onTap: onTap ?? () {},
    );
  }
}
