import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';
import '../../../../widgets/tag_chip.dart';

class _Repo {
  const _Repo(this.name, this.desc, this.tag, this.url, {this.stars});
  final String name;
  final String desc;
  final String tag;
  final String url;
  final String? stars;
}

const _repos = <_Repo>[
  _Repo(
    'Quran-App-Data',
    'An open dataset of Quran, Hadith, Azkar and Names of Allah — used as the data layer for Quran applications.',
    'Open Dataset',
    'https://github.com/Mohamed-Nagdy/Quran-App-Data',
    stars: '231',
  ),
  _Repo(
    'fetch_link_data',
    'A Dart package that extracts title, description and preview images from any URL for rich link previews.',
    'My Package',
    'https://github.com/Mohamed-Nagdy/fetch_link_data',
    stars: '4',
  ),
  _Repo(
    'a_dialog',
    'A flexible, composable dialog system for Flutter — custom dialogs with a clean, declarative API.',
    'My Package',
    'https://github.com/Mohamed-Nagdy/a_dialog',
  ),
  _Repo(
    'font_awesome_flutter',
    'Contributed a NonDeprecatedIcons map exposing 2,089 active icons to the community Font Awesome package.',
    'Contribution',
    'https://github.com/fluttercommunity/font_awesome_flutter',
  ),
  _Repo(
    'flutter-quill',
    'Contributions to the popular rich-text editor for Flutter.',
    'Contribution',
    'https://github.com/singerdmx/flutter-quill',
  ),
  _Repo(
    'flutter_colorpicker',
    'Contributions to a widely-used HSV/HSL/RGB color picker for Flutter apps.',
    'Contribution',
    'https://github.com/mchome/flutter_colorpicker',
  ),
];

class OpenSourceSection extends StatelessWidget {
  const OpenSourceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      alt: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'OPEN SOURCE',
            number: '07',
            title: 'We give back to the ecosystem we build on.',
            lead:
                'Published packages, an open dataset trusted by other developers, and contributions to popular Flutter libraries.',
          ),
          const SizedBox(height: 48),
          LayoutBuilder(builder: (context, constraints) {
            final w = constraints.maxWidth;
            final cols = w >= 1040 ? 3 : (w >= 680 ? 2 : 1);
            const gap = 22.0;
            final cardW = (w - gap * (cols - 1)) / cols;
            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (var i = 0; i < _repos.length; i++)
                  SizedBox(
                    width: cardW,
                    height: 200,
                    child: Reveal(
                      delay: Duration(milliseconds: 40 * i),
                      child: _RepoCard(repo: _repos[i]),
                    ),
                  ),
              ],
            );
          }),
          const SizedBox(height: 36),
          Reveal(
            child: GhostButton(
              label: 'See more on GitHub',
              icon: FontAwesomeIcons.github.data,
              onTap: () => launchUrlString(githubURL,
                  mode: LaunchMode.externalApplication),
            ),
          ),
        ],
      ),
    );
  }
}

class _RepoCard extends StatelessWidget {
  const _RepoCard({required this.repo});
  final _Repo repo;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return GlassCard(
      hoverable: true,
      onTap: () =>
          launchUrlString(repo.url, mode: LaunchMode.externalApplication),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(FontAwesomeIcons.github.data, size: 18, color: c.textSecondary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(repo.name,
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
              if (repo.stars != null) ...[
                Icon(Icons.star_rounded, size: 16, color: c.warm),
                const SizedBox(width: 4),
                Text(repo.stars!,
                    style: TextStyle(
                        color: c.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
              ],
            ],
          ),
          const SizedBox(height: 14),
          Expanded(
            child:
                Text(repo.desc, style: theme.textTheme.bodySmall, maxLines: 4),
          ),
          const SizedBox(height: 12),
          TagChip(repo.tag, accent: repo.tag != 'Contribution'),
        ],
      ),
    );
  }
}
