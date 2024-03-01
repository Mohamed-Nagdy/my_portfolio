import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../gen/assets.gen.dart';
import '../widgets/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
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
              child: Sections(),
            )
          : null,
    );
  }
}
