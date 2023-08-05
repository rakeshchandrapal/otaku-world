import 'package:flutter/material.dart';
import 'package:otaku_world/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.horizontalPadding = 12,
    this.verticalPadding = 14,
    this.width,
    required this.onTap,
    required this.label,
    this.color = AppColors.sunsetOrange,
    this.fontSize,
    this.radius,
  });

  final double horizontalPadding;
  final double? width;
  final VoidCallback onTap;
  final String label;
  final Color color;
  final double? fontSize;
  final double? radius;
  final double verticalPadding;

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
            borderRadius: BorderRadius.circular(radius ?? 20),
            color: color,
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
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: fontSize,
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
