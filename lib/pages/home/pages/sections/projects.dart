import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../models/project.dart';
import '../../../../widgets/primary_chip.dart';
import '../../providers/projects.dart';
import '../../widgets/project_widget.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsFuture = ref.watch(projectsProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          const PrimaryChip(text: 'Projects'),
          const SizedBox(height: 16),
          Text(
            'Some of the noteworthy projects I have built:',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 48),
          projectsFuture.when(
            data: (data) {
              return ResponsiveGridView.builder(
                itemCount: data.size,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const ResponsiveGridDelegate(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  maxCrossAxisExtent: 800,
                  childAspectRatio: 2.0,
                ),
                itemBuilder: (context, index) {
                  final project = Project.fromJson(data.docs[index].data());
                  return ProjectWidget(
                    project: project,
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ],
      ),
    );
  }
}
