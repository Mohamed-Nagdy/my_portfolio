import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'TRACK RECORD',
            number: '06',
            title: 'Years of shipping, milestone by milestone.',
            lead:
                'From our first apps to a high-concurrency social platform — the products that built the studio.',
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Column(
              children: [
                for (var i = 0; i < milestones.length; i++)
                  Reveal(
                    delay: Duration(milliseconds: 50 * i),
                    child: _ExpRow(
                      item: milestones[i],
                      isFirst: i == milestones.length - 1,
                      isLast: i == milestones.length - 1,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpRow extends StatelessWidget {
  const _ExpRow(
      {required this.item, required this.isFirst, required this.isLast});
  final Milestone item;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline rail
          Column(
            children: [
              Container(
                width: 14,
                height: 14,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  gradient: isFirst ? AppColors.accentGradient : null,
                  color: isFirst ? null : c.surfaceAlt,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isFirst ? Colors.transparent : c.borderStrong,
                      width: 2),
                ),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: c.border)),
            ],
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.year,
                      style: monoLabel(context, color: c.accent, size: 12)),
                  const SizedBox(height: 6),
                  Text(item.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 10),
                  Text(item.blurb, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
