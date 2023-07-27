import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/providers/graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/router.dart';
import 'package:otaku_world/theme/app_theme.dart';
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
    return GraphQlProvider(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        routerConfig: router,
      ),
    );
  }
}
