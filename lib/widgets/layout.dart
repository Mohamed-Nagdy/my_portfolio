import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/style.dart';
import 'reveal.dart';

const double kMaxContentWidth = 1180;

/// Centers content and caps its width for comfortable reading on large screens.
class ContentWidth extends StatelessWidget {
  const ContentWidth({
    required this.child,
    super.key,
    this.maxWidth = kMaxContentWidth,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}

/// A full-bleed vertical section with optional alternate background tint and a
/// centered, width-capped content area.
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    required this.child,
    super.key,
    this.alt = false,
    this.vertical = 110,
    this.maxWidth = kMaxContentWidth,
  });

  final Widget child;
  final bool alt;
  final double vertical;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final isMobile = MediaQuery.sizeOf(context).width < 720;
    return Container(
      width: double.infinity,
      color: alt ? c.bgAlt : c.bg,
      padding:
          EdgeInsets.symmetric(vertical: isMobile ? vertical * 0.6 : vertical),
      child: ContentWidth(maxWidth: maxWidth, child: child),
    );
  }
}

/// A section heading: mono kicker + number, a display title, and optional lead.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.kicker,
    required this.title,
    super.key,
    this.number,
    this.lead,
    this.center = false,
  });

  final String kicker;
  final String title;
  final String? number;
  final String? lead;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final cross = center ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final align = center ? TextAlign.center : TextAlign.start;

    return Reveal(
      child: Column(
        crossAxisAlignment: cross,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 26,
                height: 1.5,
                color: c.accent,
                margin: const EdgeInsets.only(right: 12),
              ),
              Text(
                number != null ? '$number — $kicker' : kicker,
                style: monoLabel(context, color: c.accent),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              title,
              textAlign: align,
              style: theme.textTheme.headlineLarge,
            ),
          ),
          if (lead != null) ...[
            const SizedBox(height: 18),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                lead!,
                textAlign: align,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
