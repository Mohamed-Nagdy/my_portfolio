import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../models/project.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/style.dart';
import '../../../widgets/atmosphere.dart';
import '../../../widgets/glass_card.dart';
import '../../../widgets/layout.dart';
import '../../../widgets/project_image.dart';
import '../../../widgets/tag_chip.dart';
import '../../home/pages/home.dart';
import '../../home/providers/projects.dart';
import '../../home/widgets/project_widget.dart';
import '../pages/single_project.dart';
import 'store_button.dart';

class SingleProjectWidget extends StatelessWidget {
  const SingleProjectWidget({required this.project, super.key});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    final idx = projectIndex(project);
    final prev = projectAt(idx - 1);
    final next = projectAt(idx + 1);

    return Atmosphere(
      glow: true,
      child: SafeArea(
        child: SingleChildScrollView(
          child: ContentWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BackBar(),
                  const SizedBox(height: 28),
                  _Hero(project: project, isWide: isWide),
                  const SizedBox(height: 64),
                  if (isWide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 6, child: _Overview(project: project)),
                        const SizedBox(width: 48),
                        Expanded(flex: 4, child: _TechPanel(project: project)),
                      ],
                    )
                  else ...[
                    _Overview(project: project),
                    const SizedBox(height: 40),
                    _TechPanel(project: project),
                  ],
                  if (project.screenshots.isNotEmpty) ...[
                    const SizedBox(height: 72),
                    _GalleryHeader(),
                    const SizedBox(height: 24),
                    _Gallery(project: project),
                  ],
                  const SizedBox(height: 72),
                  _ProjectNav(prev: prev, next: next),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.goNamed(HomePage.routeName);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_rounded,
                    size: 18, color: c.textSecondary),
                const SizedBox(width: 8),
                Text('All work',
                    style: TextStyle(
                        color: c.textSecondary, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/branding/logo.png', width: 28, height: 28),
            const SizedBox(width: 8),
            Text('Nagdy Labs',
                style: TextStyle(
                    color: c.textPrimary, fontWeight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.project, required this.isWide});
  final Project project;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final logo = _LogoPanel(project: project);
    final info = _HeroInfo(project: project);
    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 230, child: logo),
          const SizedBox(width: 44),
          Expanded(child: info),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 150, child: logo),
        const SizedBox(height: 28),
        info,
      ],
    );
  }
}

class _LogoPanel extends StatelessWidget {
  const _LogoPanel({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final isVibezo = project.slug == 'vibezo';
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: isVibezo
              ? AppColors.vibezoGradient
              : LinearGradient(
                  colors: [
                    c.accent.withValues(alpha: 0.18),
                    c.accentAlt.withValues(alpha: 0.06),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: c.border),
        ),
        padding: const EdgeInsets.all(32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ProjectImage(project.image, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class _HeroInfo extends StatelessWidget {
  const _HeroInfo({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (project.featured) ...[
              const StatusPill('FLAGSHIP',
                  color: AppColors.vibezoPink, dot: true),
              const SizedBox(width: 10),
            ],
            Text(project.categoryLabel.toUpperCase(),
                style: monoLabel(context, color: c.accent, size: 11.5)),
          ],
        ),
        const SizedBox(height: 18),
        Text(project.title, style: theme.textTheme.displaySmall),
        if (project.tagline != null) ...[
          const SizedBox(height: 10),
          Text(project.tagline!,
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: c.textSecondary)),
        ],
        const SizedBox(height: 18),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            for (final p in project.platforms)
              _MetaBadge(icon: platformIcon(p), label: p),
            if (project.year != null)
              _MetaBadge(icon: FontAwesomeIcons.calendar.data, label: project.year!),
          ],
        ),
        if (project.hasLinks) ...[
          const SizedBox(height: 26),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              if (project.googlePlay != null)
                StoreButton(
                    icon: FontAwesomeIcons.googlePlay.data,
                    title: 'Google Play',
                    url: project.googlePlay),
              if (project.appStore != null)
                StoreButton(
                    icon: FontAwesomeIcons.appStore.data,
                    title: 'App Store',
                    url: project.appStore),
              if (project.web != null)
                StoreButton(
                    icon: FontAwesomeIcons.globe.data,
                    title: 'Website',
                    url: project.web),
            ],
          ),
        ],
        if (project.role != null) ...[
          const SizedBox(height: 22),
          Row(
            children: [
              Icon(FontAwesomeIcons.userGear.data, size: 13, color: c.textTertiary),
              const SizedBox(width: 10),
              Flexible(
                child: Text(project.role!,
                    style: TextStyle(color: c.textSecondary, fontSize: 13.5)),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _MetaBadge extends StatelessWidget {
  const _MetaBadge({required this.icon, required this.label});
  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: c.glass,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: c.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: c.textSecondary),
            const SizedBox(width: 7),
          ],
          Text(label,
              style: TextStyle(
                  color: c.textSecondary,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final body = project.longDescription ?? project.description;
    final paragraphs = body.split('\n').where((p) => p.trim().isNotEmpty);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('OVERVIEW', style: monoLabel(context, color: c.accent)),
        const SizedBox(height: 18),
        for (final p in paragraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(p.trim(),
                style: theme.textTheme.bodyLarge?.copyWith(fontSize: 16)),
          ),
        if (project.features.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text('KEY FEATURES', style: monoLabel(context, color: c.accent)),
          const SizedBox(height: 18),
          for (final f in project.features)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Icon(Icons.check_circle_rounded,
                        size: 17, color: c.accent),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(f,
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: c.textPrimary, fontSize: 14.5)),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }
}

class _TechPanel extends StatelessWidget {
  const _TechPanel({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('TECH STACK', style: monoLabel(context, color: c.accent)),
          const SizedBox(height: 18),
          Wrap(
            spacing: 9,
            runSpacing: 9,
            children: [for (final s in project.skills) TagChip(s)],
          ),
          if (project.backendStack.isNotEmpty) ...[
            const SizedBox(height: 26),
            Row(
              children: [
                Icon(FontAwesomeIcons.server.data, size: 13, color: c.warm),
                const SizedBox(width: 10),
                Text('BACKEND ARCHITECTURE',
                    style: monoLabel(context, color: c.warm, size: 11)),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 9,
              runSpacing: 9,
              children: [
                for (final s in project.backendStack) TagChip(s, accent: true)
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _GalleryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      children: [
        Container(width: 26, height: 1.5, color: c.accent),
        const SizedBox(width: 12),
        Text('SCREENS', style: monoLabel(context, color: c.accent)),
        const SizedBox(width: 14),
        Text('Tap to zoom',
            style: TextStyle(color: c.textTertiary, fontSize: 12)),
      ],
    );
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final shots = project.screenshots;
    final h = MediaQuery.sizeOf(context).width < 600 ? 320.0 : 460.0;
    return SizedBox(
      height: h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: shots.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => _openLightbox(context, shots, i),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: c.border),
                  color: c.surface,
                ),
                clipBehavior: Clip.antiAlias,
                child: ProjectImage(shots[i], fit: BoxFit.contain),
              ),
            ),
          );
        },
      ),
    );
  }

  void _openLightbox(BuildContext context, List<String> shots, int start) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.92),
      builder: (context) => _Lightbox(shots: shots, start: start),
    );
  }
}

class _Lightbox extends StatefulWidget {
  const _Lightbox({required this.shots, required this.start});
  final List<String> shots;
  final int start;

  @override
  State<_Lightbox> createState() => _LightboxState();
}

class _LightboxState extends State<_Lightbox> {
  late final PageController _ctrl = PageController(initialPage: widget.start);
  late int _current = widget.start;

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      child: Stack(
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.shots.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (context, i) => InteractiveViewer(
              maxScale: 4,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ProjectImage(widget.shots[i], fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close_rounded, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Text('${_current + 1} / ${widget.shots.length}',
                  style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectNav extends StatelessWidget {
  const _ProjectNav({required this.prev, required this.next});
  final Project? prev;
  final Project? next;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Column(
      children: [
        Divider(color: c.border),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: prev != null
                  ? _NavCard(project: prev!, isNext: false)
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: next != null
                  ? _NavCard(project: next!, isNext: true)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavCard extends StatelessWidget {
  const _NavCard({required this.project, required this.isNext});
  final Project project;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return GlassCard(
      hoverable: true,
      onTap: () => context.goNamed(
        SingleProject.routeName,
        queryParameters: {'slug': project.slug},
      ),
      child: Column(
        crossAxisAlignment:
            isNext ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(isNext ? 'NEXT PROJECT' : 'PREVIOUS PROJECT',
              style: monoLabel(context, color: c.textTertiary, size: 10.5)),
          const SizedBox(height: 8),
          Text(project.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: isNext ? TextAlign.right : TextAlign.left),
        ],
      ),
    );
  }
}
