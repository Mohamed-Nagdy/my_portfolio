import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
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

      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack);
        return true;
      };

      setPathUrlStrategy();
      await Hive.initFlutter();
      box = await Hive.openBox(Constants.mainBox.name);
      final GoRouter router = getRouter;

      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
      );

      return runApp(
        ProviderScope(
          child: DrivingSchoolDashboard(
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

class DrivingSchoolDashboard extends ConsumerStatefulWidget {
  const DrivingSchoolDashboard({required this.router, super.key});
  final GoRouter router;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PrayerTimesAppState();
}

class _PrayerTimesAppState extends ConsumerState<DrivingSchoolDashboard> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeNotifier.select((value) => value));

    return ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 600, name: MOBILE),
        Breakpoint(start: 601, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ],
      child: MaterialApp.router(
        title: 'Driving School Dashboard',
        scrollBehavior: CustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: appTheme(fontFamily),
        darkTheme: darkTheme(fontFamily),
        routerConfig: widget.router,
        themeMode: themeMode,
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return ResponsiveScaledBox(
            width: ResponsiveValue<double?>(
              context,
              conditionalValues: [
                const Condition.equals(name: MOBILE, value: 450),
                const Condition.between(start: 800, end: 1100, value: 800),
                const Condition.between(start: 1000, end: 1200, value: 1000),
              ],
            ).value,
            child: MediaQuery(
              data: mediaQueryData.copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                ),
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
