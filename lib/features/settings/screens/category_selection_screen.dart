import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/common/ui/primary_button.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/features/settings/widgets/category_chip_list.dart';
import 'package:otaku_world/graphql/__generated/features/settings/graphql/category.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/utils/ui_utils.dart';

class CategorySelectionScreen extends StatefulHookConsumerWidget {
  const CategorySelectionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState
    extends ConsumerState<CategorySelectionScreen> {

  List<String> selectedCategoryList = [];

  @override
  Widget build(BuildContext context) {
    var hook = useQuery$GetGenreCollection();

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CategorySelectionConstants.chooseInterest,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  CategorySelectionConstants.leastSelection,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                ),
              ],
            ),
            // Category Chip Selection List
            GraphQLBuilder<Query$GetGenreCollection>(
              hook: hook,
              builder: (result) {
                return Expanded(
                  child: CategoryChipList(
                    categoryList: result.GenreCollection!,
                    onSelectionChanged: (selectedCategories) {
                      selectedCategoryList = selectedCategories;
                    },
                  ),
                );
              },
              loadingBuilder: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
              ),
              child: PrimaryButton(
                onTap: () {
                  if (selectedCategoryList.length < 3) {
                    showSnackBar(
                        context, 'Please select at least 3 categories');
                  } else {
                    ref
                        .watch(sharedPreferencesProvider)
                        .setStringList('categories', selectedCategoryList)
                        .then((value) {
                      if (value) {
                        context.go('/home');
                      } else {
                        showSnackBar(context, 'Some error occurred!');
                      }
                    });
                  }
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
