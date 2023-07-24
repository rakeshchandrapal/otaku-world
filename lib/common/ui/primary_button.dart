import 'package:flutter/material.dart';
import 'package:otaku_world/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.horizontalPadding = 12,
    this.width,
    required this.onTap,
    required this.label,
  });

  final double horizontalPadding;
  final double? width;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width ??
              MediaQuery.of(context).size.width - horizontalPadding * 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.white,
                      fontFamily: 'Poppins',
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
