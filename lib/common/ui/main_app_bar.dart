import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/graphql/viewer.graphql.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:otaku_world/utils/ui_utils.dart';

class MainAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var hook = useQuery$Viewer();

    return AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: SvgPicture.asset(AssetsConstants.appLogoHorizontal),
      ),
      backgroundColor: AppColors.raisinBlack,
      actions: [
        GraphQLAvatarBuilder(hook: hook),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
