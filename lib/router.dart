import 'package:go_router/go_router.dart';

import 'pages/home/pages/home.dart';

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
    ],
  );
}
