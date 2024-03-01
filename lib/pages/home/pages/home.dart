import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../widgets/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 68,
        actions: ResponsiveBreakpoints.of(context).isMobile
            ? null
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
