import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

/// A compact technology tag used across project cards and detail pages.
class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key, this.accent = false});

  final String label;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
      decoration: BoxDecoration(
        color: accent ? c.accent.withValues(alpha: 0.12) : c.glass,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: accent ? c.accent.withValues(alpha: 0.4) : c.border,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: accent ? c.accent : c.textSecondary,
        ),
      ),
    );
  }
}

/// A small status/category pill (e.g. "Live · Streaming", "Open source").
class StatusPill extends StatelessWidget {
  const StatusPill(this.label, {super.key, this.color, this.dot = false});

  final String label;
  final Color? color;
  final bool dot;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final col = color ?? c.accent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: col.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: col.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(color: col, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: col,
            ),
          ),
        ],
      ),
    );
  }
}
