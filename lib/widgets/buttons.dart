import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

/// Primary call-to-action — a gradient pill that brightens and glows on hover.
class GradientButton extends StatefulWidget {
  const GradientButton({
    required this.label,
    required this.onTap,
    super.key,
    this.icon,
    this.expand = false,
    this.dense = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool expand;
  final bool dense;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          width: widget.expand ? double.infinity : null,
          padding: EdgeInsets.symmetric(
              horizontal: widget.dense ? 20 : 28,
              vertical: widget.dense ? 12 : 16),
          decoration: BoxDecoration(
            gradient: AppColors.accentGradient,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: _hover ? 0.55 : 0.3),
                blurRadius: _hover ? 34 : 20,
                spreadRadius: -4,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: widget.dense ? 14 : 15.5,
                  letterSpacing: 0.2,
                ),
              ),
              if (widget.icon != null) ...[
                const SizedBox(width: 9),
                Icon(widget.icon,
                    color: Colors.white, size: widget.dense ? 16 : 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Secondary action — a glass-outlined pill.
class GhostButton extends StatefulWidget {
  const GhostButton({
    required this.label,
    required this.onTap,
    super.key,
    this.icon,
    this.expand = false,
    this.dense = false,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool expand;
  final bool dense;

  @override
  State<GhostButton> createState() => _GhostButtonState();
}

class _GhostButtonState extends State<GhostButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.expand ? double.infinity : null,
          padding: EdgeInsets.symmetric(
              horizontal: widget.dense ? 20 : 28,
              vertical: widget.dense ? 12 : 16),
          decoration: BoxDecoration(
            color: _hover ? c.glassStrong : c.glass,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color:
                    _hover ? c.accent.withValues(alpha: 0.5) : c.borderStrong),
          ),
          child: Row(
            mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: c.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: widget.dense ? 14 : 15.5,
                ),
              ),
              if (widget.icon != null) ...[
                const SizedBox(width: 9),
                Icon(widget.icon,
                    color: c.textPrimary, size: widget.dense ? 16 : 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
