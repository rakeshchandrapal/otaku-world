import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/viewer.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hook = useQuery$Viewer();

    return Column(
      children: [
        Text(
          ref
              .watch(sharedPreferencesProvider)
              .getStringList('categories')
              .toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        GraphQLBuilder(
            builder: (result) {
              return Column(
                children: [
                  Text(
                    result.Viewer!.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    result.Viewer!.about.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              );
            },
            hook: hook)
      ],
    );
  }
}
