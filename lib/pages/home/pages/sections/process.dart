import 'package:flutter/material.dart';

import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class _Step {
  const _Step(this.n, this.title, this.desc);
  final String n;
  final String title;
  final String desc;
}

const _steps = <_Step>[
  _Step('01', 'Discover',
      'We map the goal, users and constraints, then turn requirements into a clear technical plan.'),
  _Step('02', 'Design',
      'Architecture, data models and interface — a system designed for clarity and long-term maintainability.'),
  _Step('03', 'Build',
      'Iterative delivery with code reviews, automated tests and continuous integration.'),
  _Step('04', 'Ship',
      'Store submissions, deployments and production monitoring — released with confidence.'),
  _Step('05', 'Scale',
      'Performance tuning, new features and ongoing support as your product grows.'),
];

class ProcessSection extends StatelessWidget {
  const ProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    return SectionContainer(
      alt: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'HOW WE WORK',
            number: '05',
            title: 'A clear path from idea to production.',
          ),
          const SizedBox(height: 48),
          if (isWide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < _steps.length; i++)
                  Expanded(
                    child: Reveal(
                      delay: Duration(milliseconds: 80 * i),
                      child: _StepView(
                          step: _steps[i], showLine: i != _steps.length - 1),
                    ),
                  ),
              ],
            )
          else
            Column(
              children: [
                for (var i = 0; i < _steps.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Reveal(
                      delay: Duration(milliseconds: 60 * i),
                      child: _StepView(step: _steps[i], showLine: false),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _StepView extends StatelessWidget {
  const _StepView({required this.step, required this.showLine});
  final _Step step;
  final bool showLine;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(step.n,
                  style: monoLabel(context, color: c.accent, size: 13)),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 1,
                  color: showLine ? c.border : Colors.transparent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(step.title, style: theme.textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(step.desc, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
