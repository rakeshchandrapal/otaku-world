import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/primary_button.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/constants/string_constants.dart';
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
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        // height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              CategorySelectionConstants.chooseInterest,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              CategorySelectionConstants.leastSelection,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            // Category Chip Selection List

            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: PrimaryButton(
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
                horizontalPadding: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
