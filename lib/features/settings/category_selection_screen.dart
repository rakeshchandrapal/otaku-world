import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/common/ui/back_button.dart';
import 'package:otaku_world/theme/colors.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (context.canPop()) ? CustomBackButton(context: context) : null,
        backgroundColor: AppColors.raisinBlack,
        elevation: 0,
      ),
      body: Center(
        child: Text('Category Selection Screen', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
