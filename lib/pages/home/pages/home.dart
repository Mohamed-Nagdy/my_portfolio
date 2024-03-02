import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../gen/assets.gen.dart';
import '../providers/scroll_controller_provider.dart';
import '../widgets/sections.dart';
import 'sections/about.dart';
import 'sections/contact.dart';
import 'sections/projects.dart';
import 'sections/skills.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.read(scrollControllerProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        leading: ResponsiveBreakpoints.of(context).isMobile
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Assets.images.logo.image(
                  width: 64,
                  height: 64,
                ),
              ),
        actions: ResponsiveBreakpoints.of(context).isMobile
            ? [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Assets.images.logo.image(
                    width: 32,
                    height: 32,
                  ),
                )
              ]
            : const [Sections()],
      ),
      drawer: ResponsiveBreakpoints.of(context).isMobile
          ? const Drawer(
              child: Sections(
                isDrawer: true,
              ),
            )
          : null,
      body: ScrollablePositionedList.builder(
        itemCount: 4,
        itemScrollController: scrollController,
        itemBuilder: (context, index) {
          return switch (index) {
            0 => const AboutSection(),
            1 => const SkillsSection(),
            2 => const ProjectsSection(),
            3 => const ContactSection(),
            _ => Container(),
          };
        },
      ),
    );
  }
}
