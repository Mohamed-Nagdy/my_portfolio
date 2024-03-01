import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../enums/skills.dart';
import '../../../../themes/style.dart';
import '../../../../utils/help_functions.dart';
import '../../../../widgets/primary_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      color: isDark(context) ? graySwatch.shade800 : graySwatch.shade50,
      child: Column(
        children: [
          const PrimaryChip(
            text: 'Skills',
          )
              .animate()
              .slideY(duration: const Duration(milliseconds: 500))
              .fadeIn(duration: const Duration(milliseconds: 500)),
          const SizedBox(height: 8),
          Text(
            'The skills, tools and technologies I am really good at:',
            style: Theme.of(context).textTheme.labelSmall,
          )
              .animate()
              .moveY(
                duration: const Duration(milliseconds: 500),
              )
              .fadeIn(duration: const Duration(milliseconds: 500)),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...Skills.values.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        e.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        e.name,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
              .animate()
              .slideY(duration: const Duration(milliseconds: 500))
              .fadeIn(duration: const Duration(milliseconds: 500)),
        ],
      ),
    );
  }
}
