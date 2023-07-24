import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/constants/assets_constants.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: SvgPicture.asset(AssetsConstants.arrowLeft),
    );
  }
}
