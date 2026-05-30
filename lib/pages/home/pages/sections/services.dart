import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../themes/app_colors.dart';
import '../../../../widgets/glass_card.dart';
import '../../../../widgets/layout.dart';
import '../../../../widgets/reveal.dart';

class _Service {
  const _Service(this.icon, this.title, this.desc, {this.featured = false});
  final IconData icon;
  final String title;
  final String desc;
  final bool featured;
}

final _services = <_Service>[
  _Service(
    FontAwesomeIcons.mobileScreenButton.data,
    'Mobile Applications',
    'Native-quality iOS & Android apps from a single Flutter codebase — fast, accessible and store-ready.',
    featured: true,
  ),
  _Service(
    FontAwesomeIcons.server.data,
    'Backend & APIs',
    'Scalable services in Node.js & NestJS — REST and GraphQL APIs, auth, payments and clean data models.',
  ),
  _Service(
    FontAwesomeIcons.bolt.data,
    'Real-time & Streaming',
    'WebSocket and Socket.IO systems, live video, chat, presence and real-time gifting at high concurrency.',
  ),
  _Service(
    FontAwesomeIcons.code.data,
    'Web Apps & Dashboards',
    'Modern web apps in React & Next.js, plus responsive Flutter Web dashboards and admin panels.',
  ),
  _Service(
    FontAwesomeIcons.cartShopping.data,
    'Websites & E-Commerce',
    'Marketing sites, landing pages and online stores — React, Next.js, Tailwind, SEO and payments, with a fast, polished UX.',
  ),
  _Service(
    FontAwesomeIcons.desktop.data,
    'Desktop Applications',
    'macOS, Windows and Linux desktop builds shipped from the same product codebase.',
  ),
  _Service(
    FontAwesomeIcons.database.data,
    'Database Design',
    'Modeling and tuning for PostgreSQL, MongoDB and MySQL — built for integrity and scale.',
  ),
  _Service(
    FontAwesomeIcons.cloudArrowUp.data,
    'Cloud, Deployment & DevOps',
    'AWS & Google Cloud, Docker and CI/CD pipelines — automated builds, releases and monitoring.',
  ),
  _Service(
    FontAwesomeIcons.penRuler.data,
    'UI/UX & Product',
    'Design systems and polished, intentional interfaces — from first concept to shipped product.',
  ),
];

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            kicker: 'WHAT WE DO',
            number: '04',
            title: 'Everything it takes to ship a product.',
            lead:
                'One studio across the whole stack — mobile, web, desktop, backend, real-time and the infrastructure that runs it.',
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
                for (var i = 0; i < _services.length; i++)
                  SizedBox(
                    width: cardW,
                    height: 214,
                    child: Reveal(
                      delay: Duration(milliseconds: 40 * i),
                      child: _ServiceTile(service: _services[i]),
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

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({required this.service});
  final _Service service;

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final theme = Theme.of(context);
    return GlassCard(
      hoverable: true,
      gradient: service.featured
          ? LinearGradient(
              colors: [
                c.accent.withValues(alpha: 0.16),
                c.accentAlt.withValues(alpha: 0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : null,
      borderColor: service.featured ? c.accent.withValues(alpha: 0.4) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              gradient: AppColors.accentGradient,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    color: c.accent.withValues(alpha: 0.35),
                    blurRadius: 16,
                    spreadRadius: -4),
              ],
            ),
            child: Icon(service.icon, color: Colors.white, size: 19),
          ),
          const Spacer(),
          Text(service.title, style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(service.desc, style: theme.textTheme.bodySmall, maxLines: 4),
        ],
      ),
    );
  }
}
