import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/primary_button.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/utils/ui_utils.dart';

class CategorySelectionScreen extends ConsumerWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Choose Your Interests',
      ),
      body: Column(
        children: [
          Text(
            'Category Selection Screen',
            style: TextStyle(color: Colors.white),
          ),
          PrimaryButton(
            onTap: () {
              ref
                  .watch(sharedPreferencesProvider)
                  .setBool('category_selected', true)
                  .then((value) {
                if (value) {
                  context.go('/home');
                } else {
                  showSnackBar(context, 'Some error occurred!');
                }
              });
            },
            label: 'Continue',
          ),
        ],
      ),
    );
  }
}
