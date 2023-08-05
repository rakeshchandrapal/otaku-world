import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/common/ui/app_scaffold.dart';
import 'package:otaku_world/features/discover/screens/discover_screen.dart';
import 'package:otaku_world/features/home/screens/home_screen.dart';
import 'package:otaku_world/features/media_slider/media_slider_screen.dart';
import 'package:otaku_world/features/my_list/screens/my_list_screen.dart';
import 'package:otaku_world/features/onboarding/screens/onboarding_screen.dart';
import 'package:otaku_world/features/settings/screens/category_selection_screen.dart';
import 'package:otaku_world/features/social/screen/social_screen.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/observers/go_route_observer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/screens/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  debugLogDiagnostics: true,
  observers: [CustomRouteObserver()],
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/onBoarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/categorySelection',
      builder: (context, state) => const CategorySelectionScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/mediaSlider/:sectionHeader',
      builder: (context, state) {
        final mediaList = state.extra! as List<Fragment$MediaShort?>;
        return MediaSliderScreen(
          sectionHeader: state.pathParameters['sectionHeader']!,
          mediaList: mediaList,
        );
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const HomeScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
          redirect: (context, state) async {
            final sharedPref = await SharedPreferences.getInstance();
            final isFirstTime = sharedPref.getBool('is_first_time');

            if (isFirstTime == null) {
              return '/onBoarding';
            } else {
              final accessToken = sharedPref.getString('access_token');
              if (accessToken == null) {
                return '/login';
              } else {
                final categorySelected = sharedPref.getStringList('categories');
                if (categorySelected == null) {
                  return '/categorySelection';
                } else {
                  return null;
                }
              }
            }
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/discover',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const DiscoverScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/social',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const SocialScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/myList',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const MyListScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            );
          },
        ),
      ],
    ),
  ],
);
