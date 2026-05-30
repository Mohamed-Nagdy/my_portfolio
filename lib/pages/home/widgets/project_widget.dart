import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/project.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/style.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/project_image.dart';
import '../../single_project/pages/single_project.dart';

IconData? platformIcon(String platform) {
  switch (platform.toLowerCase()) {
    case 'ios':
      return Icons.apple;
    case 'android':
      return Icons.android;
    case 'web':
      return Icons.public;
    default:
      return null;
  }
}

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({required this.project, super.key});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final isVibezo = project.slug == 'vibezo';
    final panelGradient = isVibezo
        ? AppColors.vibezoGradient
        : LinearGradient(
            colors: [
              c.accent.withValues(alpha: 0.16),
              c.accentAlt.withValues(alpha: 0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    return GlassCard(
      hoverable: true,
      padding: EdgeInsets.zero,
      onTap: () => context.goNamed(
        SingleProject.routeName,
        queryParameters: {'slug': project.slug},
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo panel
          Container(
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: panelGradient,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(19)),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 76,
                  width: 76,
                  child: ProjectImage(project.image, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.categoryLabel.toUpperCase(),
                        style: monoLabel(context,
                            color: c.textTertiary, size: 10.5, spacing: 1.6),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ...project.platforms.map((p) {
                      final icon = platformIcon(p);
                      if (icon == null) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(icon, size: 13, color: c.textTertiary),
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Text(project.title, style: theme.textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(
                  project.tagline ?? project.description,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'View project',
                      style: TextStyle(
                        color: c.accent,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.arrow_outward_rounded,
                        size: 15, color: c.accent),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
