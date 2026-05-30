import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/project.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/project_image.dart';
import '../../../../widgets/reveal.dart';
import '../../../../widgets/tag_chip.dart';
import '../../../single_project/pages/single_project.dart';
import '../../providers/projects.dart';
import '../../widgets/project_widget.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  static const _filters = <(String, ProjectKind?)>[
    ('All', null),
    ('Mobile', ProjectKind.mobile),
    ('Games', ProjectKind.game),
    ('Web', ProjectKind.web),
    ('Platforms', ProjectKind.platform),
  ];
  ProjectKind? _active;

  @override
  Widget build(BuildContext context) {
    final featured = featuredProject;
    final others = otherProjects
        .where((p) => _active == null || p.kind == _active)
        .toList();

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'SELECTED WORK',
            number: '02',
            title: 'Products we have designed, built and shipped.',
            lead:
                'A decade of production apps, games and platforms across mobile, web and backend — led by our flagship social platform, ViBE ZO.',
          ),
          const SizedBox(height: 48),
          Reveal(child: _FeaturedCard(project: featured)),
          const SizedBox(height: 48),
          // Filter chips
          Reveal(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final f in _filters)
                  _FilterChip(
                    label: f.$1,
                    active: _active == f.$2,
                    onTap: () => setState(() => _active = f.$2),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final cols = w >= 1040 ? 3 : (w >= 680 ? 2 : 1);
              const gap = 22.0;
              final cardW = (w - gap * (cols - 1)) / cols;
              return Wrap(
                spacing: gap,
                runSpacing: gap,
                children: [
                  for (final p in others)
                    SizedBox(
                      width: cardW,
                      height: 360,
                      child: ProjectWidget(project: p),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(
      {required this.label, required this.active, required this.onTap});
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: active ? c.accent.withValues(alpha: 0.14) : c.glass,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: active ? c.accent.withValues(alpha: 0.5) : c.border),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: active ? c.accent : c.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 13.5,
            ),
          ),
        ),
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const StatusPill('FLAGSHIP',
                color: AppColors.vibezoPink, dot: true),
            const SizedBox(width: 10),
            Text(project.categoryLabel.toUpperCase(),
                style: monoLabel(context, color: c.textTertiary, size: 11)),
          ],
        ),
        const SizedBox(height: 20),
        Text(project.title, style: theme.textTheme.displaySmall),
        const SizedBox(height: 8),
        Text(project.tagline ?? '',
            style:
                theme.textTheme.titleMedium?.copyWith(color: c.textSecondary)),
        const SizedBox(height: 18),
        Text(project.description,
            style: theme.textTheme.bodyMedium, maxLines: 4),
        const SizedBox(height: 22),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final s in project.skills.take(7)) TagChip(s),
          ],
        ),
        const SizedBox(height: 28),
        GradientButton(
          label: 'Explore case study',
          icon: Icons.arrow_forward_rounded,
          onTap: () => context.goNamed(
            SingleProject.routeName,
            queryParameters: {'slug': project.slug},
          ),
        ),
      ],
    );

    final visual = _FeaturedVisual(project: project);

    return GlassCard(
      padding: EdgeInsets.all(isWide ? 40 : 24),
      radius: 28,
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: content),
                const SizedBox(width: 44),
                Expanded(flex: 5, child: visual),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                visual,
                const SizedBox(height: 32),
                content,
              ],
            ),
    );
  }
}

class _FeaturedVisual extends StatelessWidget {
  const _FeaturedVisual({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    // ViBE ZO brand panel: logo halo + first two screenshots as phone mocks.
    final shots = project.screenshots.take(2).toList();
    return AspectRatio(
      aspectRatio: 1.15,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.vibezoGradient,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 22,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: ProjectImage(project.image, fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < shots.length; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          top: i == 0 ? 24 : 0, left: i == 0 ? 0 : 14),
                      child: _PhoneMock(image: shots[i]),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneMock extends StatelessWidget {
  const _PhoneMock({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.black.withValues(alpha: 0.5), width: 5),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.35),
              blurRadius: 24,
              offset: const Offset(0, 12)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 0.48,
          child: ProjectImage(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
