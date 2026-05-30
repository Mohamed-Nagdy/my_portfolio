import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

/// Paints a faint technical grid that fades toward the edges.
class _GridPainter extends CustomPainter {
  _GridPainter({required this.color});

  final Color color;
  static const double gap = 46;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;
    for (double x = 0; x <= size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) =>
      oldDelegate.color != color;
}

/// Scatters faint static "stars" for subtle grain/texture (dark theme only).
class _GrainPainter extends CustomPainter {
  _GrainPainter({required this.color});

  final Color color;
  static const int count = 80;

  @override
  void paint(Canvas canvas, Size size) {
    final rnd = math.Random(42);
    final paint = Paint()..color = color;
    for (int i = 0; i < count; i++) {
      final dx = rnd.nextDouble() * size.width;
      final dy = rnd.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), rnd.nextDouble() * 1.1 + 0.3, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GrainPainter oldDelegate) => false;
}

/// Ambient backdrop: layered accent glows + a faint grid + grain. Place [child]
/// (the actual content) on top.
class Atmosphere extends StatelessWidget {
  const Atmosphere({
    required this.child,
    super.key,
    this.showGrid = true,
    this.glow = true,
  });

  final Widget child;
  final bool showGrid;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Stack(
      children: [
        Positioned.fill(child: ColoredBox(color: c.bg)),
        if (glow)
          Positioned(
            top: -160,
            right: -120,
            child: _Blob(
                color: c.accent.withValues(alpha: c.isDark ? 0.20 : 0.14),
                size: 560),
          ),
        if (glow)
          Positioned(
            bottom: -200,
            left: -140,
            child: _Blob(
                color: c.accentAlt.withValues(alpha: c.isDark ? 0.16 : 0.10),
                size: 620),
          ),
        if (showGrid)
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPainter(
                  color:
                      c.textPrimary.withValues(alpha: c.isDark ? 0.035 : 0.05)),
            ),
          ),
        if (c.isDark)
          Positioned.fill(
            child: IgnorePointer(
              child: CustomPaint(
                painter:
                    _GrainPainter(color: Colors.white.withValues(alpha: 0.04)),
              ),
            ),
          ),
        child,
      ],
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}

/// A subtle accent-glow blob to drop behind individual sections.
class GlowSpot extends StatelessWidget {
  const GlowSpot({super.key, this.size = 420, this.color});
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return IgnorePointer(
      child: _Blob(
        color: (color ?? c.accent).withValues(alpha: c.isDark ? 0.14 : 0.08),
        size: size,
      ),
    );
  }
}
