import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/theme/colors.dart';

import 'back_button.dart';

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({super.key, required this.title});

  final String title;


  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: (context.canPop()) ? CustomBackButton(context: context) : null,
      backgroundColor: AppColors.raisinBlack,
      elevation: 0,
      actions: [],
    );
  }
}
