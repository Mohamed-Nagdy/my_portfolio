import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../constants.dart';
import '../../../../enums/social_links.dart';
import '../../../../themes/app_colors.dart';
import '../../../../themes/style.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    final isWide = MediaQuery.sizeOf(context).width >= 820;

    return SectionContainer(
      child: Reveal(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -80,
              right: 40,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                    c.accent.withValues(alpha: 0.25),
                    c.accent.withValues(alpha: 0),
                  ]),
                ),
              ),
            ),
            GlassCard(
              padding: EdgeInsets.all(isWide ? 56 : 28),
              radius: 28,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LET\'S TALK',
                      style: monoLabel(context, color: c.accent)),
                  const SizedBox(height: 20),
                  Text(
                    'Have a product in mind?\nLet\'s build something great.',
                    style: theme.textTheme.displaySmall
                        ?.copyWith(fontSize: isWide ? 44 : 32),
                  ),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Text(
                      "Whether you need a full product built from scratch, a backend that scales, or an extra senior engineer on your team — reach out and let's talk.",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      GradientButton(
                        label: 'Email us',
                        icon: FontAwesomeIcons.solidPaperPlane.data,
                        onTap: () => launchUrlString('mailto:$myEmail'),
                      ),
                      GhostButton(
                        label: 'Download CV',
                        icon: FontAwesomeIcons.fileArrowDown.data,
                        onTap: () => launchUrlString(cvURL,
                            mode: LaunchMode.externalApplication),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Divider(color: c.border),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _ContactLine(
                        icon: FontAwesomeIcons.envelope.data,
                        value: myEmail,
                        copyOf: myEmail,
                      ),
                      _ContactLine(
                        icon: FontAwesomeIcons.phone.data,
                        value: myPhone,
                        copyOf: myPhone,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final s in SocialLinks.values)
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () => launchUrlString(s.link,
                                    mode: LaunchMode.externalApplication),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: c.glass,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: c.border),
                                  ),
                                  child: Icon(s.icon,
                                      size: 16, color: c.textSecondary),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
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

class _ContactLine extends StatelessWidget {
  const _ContactLine(
      {required this.icon, required this.value, required this.copyOf});
  final IconData icon;
  final String value;
  final String copyOf;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: c.accent),
        const SizedBox(width: 12),
        Text(value,
            style: TextStyle(
                color: c.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 14.5)),
        const SizedBox(width: 8),
        InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: copyOf));
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$copyOf copied')),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(Icons.copy_rounded, size: 14, color: c.textTertiary),
          ),
        ),
      ],
    );
  }
}
