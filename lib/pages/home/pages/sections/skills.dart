import 'package:flutter/material.dart';

import '../../../../enums/skills.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class _Group {
  const _Group(this.title, this.skills);
  final String title;
  final List<Skills> skills;
}

const _groups = <_Group>[
  _Group('Mobile', [
    Skills.flutter,
    Skills.dart,
    Skills.android,
    Skills.ios,
    Skills.kotlin,
    Skills.java,
    Skills.swiftui,
  ]),
  _Group('Backend & Real-time', [
    Skills.nodejs,
    Skills.express,
    Skills.socketio,
    Skills.restfulAPI,
  ]),
  _Group('Data', [
    Skills.postgresql,
    Skills.mongodb,
    Skills.mysql,
    Skills.firebase,
  ]),
  _Group('Web & Frontend', [
    Skills.react,
    Skills.nextjs,
    Skills.tailwind,
    Skills.typescript,
    Skills.javascript,
    Skills.html,
    Skills.css,
    Skills.bootstrap,
    Skills.jquery,
  ]),
  _Group('Tooling & Practices', [
    Skills.git,
    Skills.github,
    Skills.responsiveDesigns,
  ]),
];

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;
    return SectionContainer(
      alt: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'CAPABILITIES',
            number: '03',
            title: 'A full-stack toolkit, battle-tested in production.',
            lead:
                'The languages, frameworks and platforms we reach for to ship reliable software end to end.',
          ),
          const SizedBox(height: 48),
          LayoutBuilder(builder: (context, constraints) {
            final cols = isWide ? 2 : 1;
            const gap = 22.0;
            final cardW = (constraints.maxWidth - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (var i = 0; i < _groups.length; i++)
                  SizedBox(
                    width: cardW,
                    child: Reveal(
                      delay: Duration(milliseconds: 60 * i),
                      child: _GroupCard(group: _groups[i]),
                    ),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.group});
  final _Group group;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.title.toUpperCase(),
              style: monoLabel(context, color: c.accent, size: 11.5)),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [for (final s in group.skills) _SkillPill(skill: s)],
          ),
        ],
      ),
    );
  }
}

class _SkillPill extends StatelessWidget {
  const _SkillPill({required this.skill});
  final Skills skill;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: c.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(skill.image, width: 20, height: 20, fit: BoxFit.contain),
          const SizedBox(width: 9),
          Text(skill.name,
              style: TextStyle(
                  color: c.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
