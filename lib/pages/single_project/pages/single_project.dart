import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import '../../home/pages/home.dart';
import '../../home/providers/projects.dart';
import '../widgets/single_project.dart';

class SingleProject extends StatelessWidget {
  const SingleProject({super.key, this.slug});
  final String? slug;
  static const routeName = '/single_project';

  @override
  Widget build(BuildContext context) {
    final project = findProjectBySlug(slug);
    final c = context.c;

    if (project == null) {
      return Scaffold(
        backgroundColor: c.bg,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Project not found',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.goNamed(HomePage.routeName),
                child: const Text('Back to home'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: c.bg,
      body: SingleProjectWidget(project: project),
    );
  }
}
