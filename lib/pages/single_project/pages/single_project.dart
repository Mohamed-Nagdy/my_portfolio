import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/project.dart';
import '../../home/providers/projects.dart';
import '../widgets/single_project.dart';

class SingleProject extends ConsumerStatefulWidget {
  const SingleProject({super.key, this.projectId});
  final String? projectId;
  static const routeName = '/single_project';

  @override
  ConsumerState<SingleProject> createState() => _SingleProjectState();
}

class _SingleProjectState extends ConsumerState<SingleProject> {
  @override
  Widget build(BuildContext context) {
    final projects = ref.watch(projectsProvider);
    return Scaffold(
      body: projects.when(
        data: (data) {
          final projectById = Project.fromJson(
            data.docs
                    .firstWhereOrNull(
                      (element) => element.id == widget.projectId,
                    )
                    ?.data() ??
                {},
          );

          return SingleProjectWidget(
            project: projectById,
          );
        },
        error: (e, s) {
          return Center(
            child: Text('$e'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
