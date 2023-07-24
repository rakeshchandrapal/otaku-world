import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/common/ui/app_scaffold.dart';
import 'package:otaku_world/features/discover/screens/discover_screen.dart';
import 'package:otaku_world/features/home/screens/home_screen.dart';
import 'package:otaku_world/features/my_list/screens/my_list_screen.dart';
import 'package:otaku_world/features/onboarding/screens/onboarding_screen.dart';
import 'package:otaku_world/features/settings/category_selection_screen.dart';
import 'package:otaku_world/features/social/screen/social_screen.dart';
import 'package:otaku_world/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/screens/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) => AppScaffold(childPage: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/home',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/discover',
          builder: (context, state) => DiscoverScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/social',
          builder: (context, state) => SocialScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigatorKey,
          path: '/myList',
          builder: (context, state) => MyListScreen(),
        ),
      ],
    ),
  ],
);

// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const HomePage(),
//       redirect: (context, state) async {
//         final sharedPref = await SharedPreferences.getInstance();
//         final isFirstTime = sharedPref.getBool('is_first_time');
//
//         if (isFirstTime == null) {
//           return '/onBoarding';
//         }else {
//           final accessToken = sharedPref.getString('access_token');
//           if (accessToken == null) {
//             return '/login';
//           }else {
//             return null;
//           }
//         }
//       },
//       routes: [
//
//       ],
//     ),
//     GoRoute(
//       path: '/onBoarding',
//       builder: (context, state) => const OnBoardingScreen(),
//     ),
//     GoRoute(
//       path: '/login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//     GoRoute(
//       path: '/categorySelection',
//       builder: (context, state) => const CategorySelectionScreen(),
//     ),
//   ],
// );