import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../themes/app_colors.dart';
import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';
import 'sections/about.dart';
import 'sections/contact.dart';
import 'sections/experience.dart';
import 'sections/hero.dart';
import 'sections/open_source.dart';
import 'sections/process.dart';
import 'sections/projects.dart';
import 'sections/services.dart';
import 'sections/skills.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scroll = ScrollController();
  final _keys = <String, GlobalKey>{
    'about': GlobalKey(),
    'work': GlobalKey(),
    'skills': GlobalKey(),
    'services': GlobalKey(),
    'contact': GlobalKey(),
  };
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      final scrolled = _scroll.offset > 40;
      if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
    });
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _goTo(String id) {
    final ctx = _keys[id]?.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    final self = context.findRenderObject();
    if (box == null || self == null) return;
    final dy = box.localToGlobal(Offset.zero, ancestor: self).dy;
    final target =
        (_scroll.offset + dy - 78).clamp(0.0, _scroll.position.maxScrollExtent);
    _scroll.animateTo(target,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    return Scaffold(
      backgroundColor: c.bg,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                HeroSection(
                    onPrimary: () => _goTo('contact'),
                    onSecondary: () => _goTo('work')),
                KeyedSubtree(key: _keys['about'], child: const AboutSection()),
                KeyedSubtree(
                    key: _keys['work'], child: const ProjectsSection()),
                KeyedSubtree(
                    key: _keys['skills'], child: const SkillsSection()),
                KeyedSubtree(
                    key: _keys['services'], child: const ServicesSection()),
                const ProcessSection(),
                const ExperienceSection(),
                const OpenSourceSection(),
                KeyedSubtree(
                    key: _keys['contact'], child: const ContactSection()),
                Footer(onNav: _goTo),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: NavBar(scrolled: _scrolled, onNav: _goTo),
          ),
        ],
      ),
    );
  }
}
