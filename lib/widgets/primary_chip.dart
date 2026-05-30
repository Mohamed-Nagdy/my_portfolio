import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/style.dart';

/// Mono kicker label (e.g. "SKILLS"). Retained name for compatibility.
class PrimaryChip extends StatelessWidget {
  const PrimaryChip({
    required this.text,
    super.key,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: c.accent.withValues(alpha: 0.1),
        border: Border.all(color: c.accent.withValues(alpha: 0.35)),
      ),
      child: Text(
        text.toUpperCase(),
        style: monoLabel(context, color: c.accent),
      ),
    );
  }
}
