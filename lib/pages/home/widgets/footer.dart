import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants.dart';
import '../../../enums/social_links.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/layout.dart';

class Footer extends StatelessWidget {
  const Footer({required this.onNav, super.key});
  final void Function(String id) onNav;

  static const _links = <(String, String)>[
    ('Work', 'work'),
    ('Services', 'services'),
    ('Skills', 'skills'),
    ('About', 'about'),
    ('Contact', 'contact'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final isWide = MediaQuery.sizeOf(context).width >= 760;

    final brand = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/branding/logo.png', width: 30, height: 30),
            const SizedBox(width: 10),
            Text(studioName,
                style: TextStyle(
                    color: c.textPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 17)),
          ],
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Text(
            'A founder-led software studio building production-grade apps, backends and real-time systems.',
            style: TextStyle(color: c.textSecondary, fontSize: 13, height: 1.6),
          ),
        ),
      ],
    );

    final nav = Wrap(
      spacing: 24,
      runSpacing: 12,
      children: [
        for (final l in _links)
          _FooterLink(label: l.$1, onTap: () => onNav(l.$2)),
      ],
    );

    final socials = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final s in SocialLinks.values)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () =>
                  launchUrlString(s.link, mode: LaunchMode.externalApplication),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: c.glass,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: c.border),
                ),
                child: Icon(s.icon, size: 15, color: c.textSecondary),
              ),
            ),
          ),
      ],
    );

    return Container(
      width: double.infinity,
      color: c.bgAlt,
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: ContentWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: brand),
                  Expanded(flex: 4, child: nav),
                  socials,
                ],
              )
            else ...[
              brand,
              const SizedBox(height: 28),
              nav,
              const SizedBox(height: 24),
              socials,
            ],
            const SizedBox(height: 40),
            Divider(color: c.border),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: Text('© 2026 $studioName · All rights reserved',
                      style: TextStyle(color: c.textTertiary, fontSize: 12.5)),
                ),
                const Spacer(),
                Text('Built with Flutter',
                    style: TextStyle(color: c.textTertiary, fontSize: 12.5)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            color: _hover ? c.accent : c.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
