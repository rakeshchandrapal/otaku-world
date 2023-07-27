import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/error_screen.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'dart:developer' as dev;

part 'graphql.g.dart';

@riverpod
class GraphQL extends _$GraphQL {
  reset() {
    Link link = HttpLink('https://graphql.anilist.co');

    var token = ref.watch(sharedPreferencesProvider).getString('access_token');
    if (token != null) {
      link = HttpLink(
        'https://graphql.anilist.co',
        defaultHeaders: {'Authorization': 'Bearer $token'},
      );
    }

    state = AsyncData(ValueNotifier(GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    )));
  }

  @override
  FutureOr<ValueNotifier<GraphQLClient>> build() async {
    HttpLink link = HttpLink('https://graphql.anilist.co');

    final accessToken = ref.read(sharedPreferencesProvider).getString('access_token');

    if (accessToken != null) {
      dev.log('Providing client with link', name: 'Auth');
      link = HttpLink(
        'https://graphql.anilist.co',
        defaultHeaders: {
          'Authorization' : 'Bearer $accessToken',
        },
      );
    }

    return ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: link),);
  }
}

class GraphQlProvider extends ConsumerWidget {
  const GraphQlProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var graphql = ref.watch(graphQLProvider);

    return graphql.when(
      data: (data) => GraphQLProvider(
        client: data,
        child: child,
      ),
      error: (error, stackTrace) {
        dev.log('Got error: $stackTrace', name: 'GraphQL');
        return ErrorScreen(error: error.toString());
      },
      loading: () => const CircularProgressIndicator(),
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
    );
  }
}
