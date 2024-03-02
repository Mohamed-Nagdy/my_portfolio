import 'package:go_router/go_router.dart';

import 'pages/home/pages/home.dart';
import 'pages/single_project/pages/single_project.dart';

GoRouter get getRouter {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: HomePage.routeName,
    routes: [
      GoRoute(
        path: HomePage.routeName,
        name: HomePage.routeName,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: SingleProject.routeName,
        name: SingleProject.routeName,
        builder: (context, state) {
          final projectId = state.uri.queryParameters['id'];
          return SingleProject(
            projectId: projectId,
          );
        },
      ),
    ],
  );
}
