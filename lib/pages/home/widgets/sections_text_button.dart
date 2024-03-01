import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SectionsTextButton extends StatelessWidget {
  const SectionsTextButton({
    required this.text,
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width:
            ResponsiveBreakpoints.of(context).isMobile ? double.infinity : null,
        child: Text(text),
      ),
    );
  }
}
