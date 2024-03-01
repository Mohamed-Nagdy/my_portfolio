import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../gen/assets.gen.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/primary_button.dart';
import 'sections_text_button.dart';

class Sections extends ConsumerWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ResponsiveRowColumn(
      rowPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      columnPadding: const EdgeInsets.symmetric(vertical: 16),
      layout: ResponsiveBreakpoints.of(context).isMobile
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: SectionsTextButton(
            text: 'Home',
            onTap: () {},
          ),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 0)),
        ResponsiveRowColumnItem(
          child: SectionsTextButton(
            text: 'About',
            onTap: () {},
          ),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 0)),
        ResponsiveRowColumnItem(
          child: SectionsTextButton(
            text: 'Projects',
            onTap: () {},
          ),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 0)),
        ResponsiveRowColumnItem(
          child: SectionsTextButton(
            text: 'Skills',
            onTap: () {},
          ),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 0)),
        ResponsiveRowColumnItem(
          child: SectionsTextButton(
            text: 'Contact',
            onTap: () {},
          ),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 24)),
        ResponsiveRowColumnItem(
          child: Consumer(builder: (context, ref, _) {
            final themeMode = ref.watch(themeNotifier);
            if (ResponsiveBreakpoints.of(context).isMobile) {
              return ListTile(
                onTap: () => ref.read(themeNotifier.notifier).changeTheme(),
                title: const Text('Theme Mode'),
                trailing: Image.asset(
                  themeMode == ThemeMode.light
                      ? Assets.images.sun.path
                      : Assets.images.moon.path,
                  width: 36,
                  height: 36,
                ),
              );
            }
            return InkWell(
              onTap: () => ref.read(themeNotifier.notifier).changeTheme(),
              child: Image.asset(
                themeMode == ThemeMode.light
                    ? Assets.images.sun.path
                    : Assets.images.moon.path,
                width: 36,
                height: 36,
              ),
            );
          }),
        ),
        const ResponsiveRowColumnItem(child: SizedBox(width: 16)),
        const ResponsiveRowColumnItem(child: SizedBox(height: 16)),
        ResponsiveRowColumnItem(
          child: PrimaryButton(
            title: 'Download CV',
            onTap: () {},
            width: ResponsiveBreakpoints.of(context).isMobile
                ? double.infinity
                : null,
          ),
        ),
      ],
    );
  }
}
