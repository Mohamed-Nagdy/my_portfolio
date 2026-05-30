import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/project.dart';
import '../../../my_projects.dart' as data;

/// All projects, served locally (no runtime backend dependency).
final projectsProvider = Provider<List<Project>>((ref) => data.projects);

/// The single featured project (ViBE ZO) shown as a case study.
Project get featuredProject => data.projects
    .firstWhere((p) => p.featured, orElse: () => data.projects.first);

/// Every non-featured project, in catalogue order.
List<Project> get otherProjects =>
    data.projects.where((p) => !p.featured).toList();

Project? findProjectBySlug(String? slug) =>
    data.projects.firstWhereOrNull((p) => p.slug == slug);

int projectIndex(Project p) =>
    data.projects.indexWhere((e) => e.slug == p.slug);

Project? projectAt(int index) =>
    (index >= 0 && index < data.projects.length) ? data.projects[index] : null;
