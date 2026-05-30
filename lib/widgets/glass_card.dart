import 'dart:ui';

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

/// A frosted-glass surface with a hairline border — the core container of the
/// Midnight Tech system. Optionally lifts and glows on hover.
class GlassCard extends StatefulWidget {
  const GlassCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(24),
    this.radius = 20,
    this.onTap,
    this.hoverable = false,
    this.gradient,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsets padding;
  final double radius;
  final VoidCallback? onTap;
  final bool hoverable;
  final Gradient? gradient;
  final Color? borderColor;

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final lifted = widget.hoverable && _hover;

    final border = widget.borderColor ??
        (lifted ? c.accent.withValues(alpha: 0.45) : c.border);

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(0, lifted ? -4 : 0, 0),
      padding: widget.padding,
      decoration: BoxDecoration(
        gradient: widget.gradient,
        color: widget.gradient == null ? c.glass : null,
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(color: border, width: 1),
        boxShadow: [
          if (lifted)
            BoxShadow(
              color: c.accent.withValues(alpha: c.isDark ? 0.22 : 0.16),
              blurRadius: 36,
              spreadRadius: -6,
              offset: const Offset(0, 14),
            )
          else if (!c.isDark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
        ],
      ),
      child: widget.child,
    );

    // Backdrop blur for the frosted effect (dark theme reads best).
    content = ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: content,
      ),
    );

    if (widget.onTap != null || widget.hoverable) {
      content = MouseRegion(
        cursor:
            widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: GestureDetector(onTap: widget.onTap, child: content),
      );
    }

    return content;
  }
}
