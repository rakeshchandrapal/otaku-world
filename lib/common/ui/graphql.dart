import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:developer' as dev;

class GraphQLBuilder<T> extends StatelessWidget {
  const GraphQLBuilder({super.key, required this.builder, required this.hook});

  final Widget Function(T result) builder;
  final QueryHookResult<T> hook;

  @override
  Widget build(BuildContext context) {
    if (hook.result.isLoading && hook.result.data == null) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }

    if (hook.result.hasException) {
      if (hook.result.exception!.linkException != null &&
          hook.result.exception!.linkException is ServerException) {
        dev.log('Got error: ${hook.result.exception?.linkException}');
        var message = (hook.result.exception!.linkException as ServerException)
            .parsedResponse
            ?.errors
            ?.first
            .message;
        if (message == 'Invalid token') {
          return ElevatedButton(
            onPressed: () async {
              var settings = await SharedPreferences.getInstance();
              settings.remove('access_token').then(
                (value) {
                  context.go('/login');
                },
              );
            },
            child: const Text('Go to LogIn Page'),
          );
        } else {
          return Column(
            children: [
              Text(
                'Some error occurred! Please try again!',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.maxRed,
                    ),
              ),
              TextButton(
                onPressed: hook.refetch,
                child: Text(
                  'Try again',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.sunsetOrange,
                      ),
                ),
              ),
            ],
          );
        }
      }

      if (hook.result.data == null) {
        return const Center(
          child: Text('An error occurred'),
        );
      }
    }

    return builder(hook.result.parsedData as T);
  }
}
