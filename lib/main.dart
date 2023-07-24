import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/features/onboarding/screens/onboarding_screen.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/router.dart';
import 'package:otaku_world/theme/app_theme.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      routerConfig: router,
    );
  }
}
