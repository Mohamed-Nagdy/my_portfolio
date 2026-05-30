import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants.dart';
import '../../../../enums/social_links.dart';
import '../../../../themes/app_colors.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= 900;

    const founder = _FounderCard();
    const text = _AboutText();

    return SectionContainer(
      alt: true,
      child: isWide
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 6, child: text),
                SizedBox(width: 64),
                Expanded(flex: 5, child: founder),
              ],
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text,
                SizedBox(height: 40),
                founder,
              ],
            ),
    );
  }
}

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return Reveal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
              kicker: aboutKicker, number: '01', title: aboutTitle),
          const SizedBox(height: 24),
          Text(aboutLead,
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: c.textPrimary, fontSize: 18)),
          const SizedBox(height: 18),
          Text(aboutBody, style: theme.textTheme.bodyMedium),
          const SizedBox(height: 28),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _Fact(icon: FontAwesomeIcons.locationDot.data, label: myAddress),
              _Fact(icon: FontAwesomeIcons.graduationCap.data, label: education),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              for (final s in SocialLinks.values)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: _SocialButton(link: s),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: c.accent),
        const SizedBox(width: 10),
        Text(label, style: TextStyle(color: c.textSecondary, fontSize: 13.5)),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({required this.link});
  final SocialLinks link;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return InkWell(
      onTap: () =>
          launchUrlString(link.link, mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: c.glass,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: c.border),
        ),
        child: Icon(link.icon, size: 17, color: c.textSecondary),
      ),
    );
  }
}

class _FounderCard extends StatelessWidget {
  const _FounderCard();

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return Reveal(
      delay: const Duration(milliseconds: 120),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -24,
            top: -24,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  c.accent.withValues(alpha: 0.32),
                  c.accent.withValues(alpha: 0),
                ]),
              ),
            ),
          ),
          GlassCard(
            radius: 24,
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: c.accent.withValues(alpha: 0.4),
                              blurRadius: 18,
                              spreadRadius: -4),
                        ],
                      ),
                      child: Image.asset('assets/branding/logo.png',
                          width: 56, height: 56),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(founderName, style: theme.textTheme.titleLarge),
                          const SizedBox(height: 4),
                          Text('Founder · Nagdy Labs',
                              style: TextStyle(
                                  color: c.accent,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Divider(color: c.border, height: 1),
                const SizedBox(height: 22),
                _CardFact(
                    icon: FontAwesomeIcons.briefcase.data,
                    label: 'Head of Software Development',
                    value: 'Zytronic'),
                const SizedBox(height: 16),
                _CardFact(
                    icon: FontAwesomeIcons.graduationCap.data,
                    label: 'B.Sc. Computer Engineering',
                    value: 'Zagazig University · 2020'),
                const SizedBox(height: 16),
                _CardFact(
                    icon: FontAwesomeIcons.locationDot.data,
                    label: 'Based in',
                    value: 'Cairo, Egypt'),
                const SizedBox(height: 24),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                  decoration: BoxDecoration(
                    color: c.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: c.success.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: c.success, shape: BoxShape.circle)),
                      const SizedBox(width: 10),
                      Text('Available for new projects',
                          style: TextStyle(
                              color: c.success,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600)),
                    ],
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

class _CardFact extends StatelessWidget {
  const _CardFact(
      {required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: c.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(icon, size: 14, color: c.accent),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(color: c.textTertiary, fontSize: 11.5)),
              const SizedBox(height: 2),
              Text(value,
                  style: TextStyle(
                      color: c.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
