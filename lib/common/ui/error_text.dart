import 'package:flutter/material.dart';
import 'package:otaku_world/theme/colors.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors.maxRed,
          ),
        ),
        TextButton(
          onPressed: onPressed,
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
