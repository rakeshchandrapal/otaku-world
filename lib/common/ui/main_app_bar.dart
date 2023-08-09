import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/graphql/viewer.graphql.dart';
import 'package:otaku_world/theme/colors.dart';

import 'dart:developer' as dev;

import 'package:otaku_world/utils/ui_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appBarNotifierProvider = ChangeNotifierProvider((ref) => AppBarStateNotifier());

class AppBarStateNotifier extends ChangeNotifier {
  bool isRefreshed = false;

  void setIsRefreshed(bool isRefreshed) {
    this.isRefreshed = isRefreshed;
    // notifyListeners();
  }

  void triggerAppBarRebuild() {
    isRefreshed = true;
    notifyListeners();
  }
}

class MainAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('Building the app-bar', name: 'AppBar');
    var hook = useQuery$Viewer();
    final value = ref.watch(appBarNotifierProvider);

    useEffect(() {
      dev.log('Hook data: ${hook.result.data}', name: 'AppBar');
      return null;
    }, [hook.result.data]);

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: SvgPicture.asset(AssetsConstants.appLogoHorizontal),
      ),
      backgroundColor: AppColors.raisinBlack,
      actions: [
        _buildAvatar(context, hook, ref),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

Widget _buildAvatar(BuildContext context, QueryHookResult<Query$Viewer> hook, WidgetRef ref) {
  if (hook.result.isLoading && hook.result.data == null) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.chineseWhite,
        child: Icon(Icons.abc_outlined),
      ),
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
        if (ref.read(appBarNotifierProvider).isRefreshed) {
          hook.refetch();
          ref.read(appBarNotifierProvider).setIsRefreshed(false);
        }
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.chineseWhite,
              child: Icon(Icons.group),
            ),
          );
      }
    }

    if (hook.result.data == null) {
      return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.chineseWhite,
          child: Icon(Icons.group_add),
        ),
      );
    }
  }

  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 10,
    ),
    child: GestureDetector(
      onTap: () {
        showSnackBar(context, 'Coming soon...');
      },
      child: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
          hook.result.parsedData!.Viewer!.avatar!.medium!,
        ),
      ),
    ),
  );
}
