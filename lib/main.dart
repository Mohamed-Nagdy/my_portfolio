import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';

import 'constants.dart';
import 'firebase_options.dart';
import 'providers/theme_provider.dart';
import 'router.dart';
import 'themes/style.dart';
import 'utils/scroll_behavior.dart';

Box<dynamic>? box;

// Future<void> uploadProjectsToFirebase() async {
//   // final savedCount = box?.get(Constants.savedProjectsCountKey.name) ?? 0;
//   // if (savedCount == 0 || savedCount != myProjects.length) {
//   final db = FirebaseFirestore.instance;

//   // remove all projects
//   final docs = await db.collection(Constants.projects.name).get();
//   for (DocumentSnapshot ds in docs.docs) {
//     await ds.reference.delete();
//   }

//   // add all projects again with the newest ones
//   for (var element in myProjects) {
//     await db
//         .collection(Constants.projects.name)
//         .add(element)
//         .then((DocumentReference doc) {});
//   }

//   // save the new count of projects
//   // await box?.put(Constants.savedProjectsCountKey.name, myProjects.length);
//   // }
// }

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      try {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } catch (e) {
        log(e.toString());
      }

      setPathUrlStrategy();
      await Hive.initFlutter();
      box = await Hive.openBox(Constants.mainBox.name);
      final GoRouter router = getRouter;

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      return runApp(
        ProviderScope(
          child: NagdyLabsApp(
            router: router,
          ),
        ),
      );
    },
    (e, stack) {
      log('runZonedGuarded error $e, With Stack $stack');
    },
  );
}

class NagdyLabsApp extends ConsumerWidget {
  const NagdyLabsApp({required this.router, super.key});
  final GoRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifier.select((value) => value));

    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 600, name: MOBILE),
        Breakpoint(start: 601, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ],
      child: MaterialApp.router(
        title: 'Nagdy Labs — Software Studio',
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        darkTheme: darkTheme(),
        routerConfig: router,
        themeMode: themeMode,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(
              textScaler: const TextScaler.linear(1),
            ),
            child: child ?? const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
