import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../constants.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/atmosphere.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/layout.dart';

class HeroSection extends StatelessWidget {
  const HeroSection(
      {required this.onPrimary, required this.onSecondary, super.key});
  final VoidCallback onPrimary;
  final VoidCallback onSecondary;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 720;
    final headlineSize = isMobile ? 40.0 : (size.width < 1100 ? 58.0 : 72.0);

    return Atmosphere(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: size.height * 0.96),
        child: Center(
          child: ContentWidth(
            child: Padding(
              padding: EdgeInsets.only(top: isMobile ? 120 : 96, bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _AvailablePill()
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: 0.4, curve: Curves.easeOut),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Container(width: 30, height: 1.5, color: c.accent),
                      const SizedBox(width: 12),
                      Text(studioKicker,
                          style: monoLabel(context, color: c.accent)),
                    ],
                  ).animate().fadeIn(delay: 100.ms, duration: 500.ms),
                  const SizedBox(height: 22),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 920),
                    child: _Headline(size: headlineSize),
                  ),
                  const SizedBox(height: 28),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Text(studioSubhead, style: theme.textTheme.bodyLarge)
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 600.ms)
                        .slideY(begin: 0.3, curve: Curves.easeOut),
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      GradientButton(
                          label: 'Start a project',
                          icon: Icons.arrow_forward_rounded,
                          onTap: onPrimary),
                      GhostButton(label: 'View our work', onTap: onSecondary),
                    ],
                  ).animate().fadeIn(delay: 700.ms, duration: 600.ms),
                  SizedBox(height: isMobile ? 56 : 88),
                  const _StatStrip()
                      .animate()
                      .fadeIn(delay: 900.ms, duration: 700.ms)
                      .slideY(begin: 0.3, curve: Curves.easeOut),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final display = Theme.of(context).textTheme.displayLarge;
    return RichText(
      text: TextSpan(
        style: display?.copyWith(fontSize: size),
        children: [
          const TextSpan(text: 'We build '),
          TextSpan(
            text: 'production-grade',
            style: TextStyle(
              foreground: Paint()
                ..shader = AppColors.accentGradient
                    .createShader(const Rect.fromLTWH(0, 0, 600, 80)),
            ),
          ),
          TextSpan(
              text: ' apps & backends.',
              style: TextStyle(color: c.textPrimary)),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 250.ms, duration: 700.ms)
        .slideY(begin: 0.2, curve: Curves.easeOutCubic);
  }
}

class _AvailablePill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: c.glass,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: c.success, shape: BoxShape.circle),
          )
              .animate(onPlay: (ctrl) => ctrl.repeat(reverse: true))
              .fadeIn()
              .then()
              .fade(begin: 1, end: 0.3, duration: 1200.ms),
          const SizedBox(width: 10),
          Text('Available for new projects',
              style: TextStyle(
                  color: c.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13)),
        ],
      ),
    );
  }
}

class _StatStrip extends StatelessWidget {
  const _StatStrip();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Wrap(
      spacing: 48,
      runSpacing: 28,
      children: [
        for (final s in studioStats)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShaderMask(
                shaderCallback: (r) => AppColors.accentGradient.createShader(r),
                child: Text(
                  s.$1,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: Colors.white, fontSize: 40),
                ),
              ),
              const SizedBox(height: 4),
              Text(s.$2,
                  style: TextStyle(color: c.textSecondary, fontSize: 13.5)),
            ],
          ),
      ],
    );
  }
}
