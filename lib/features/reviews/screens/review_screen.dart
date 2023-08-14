import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/features/reviews/widgets/review_card.dart';

import '../../../graphql/__generated/features/reviews/graphql/reviews.graphql.dart';
import '../../../theme/colors.dart';

class ReviewsScreen extends HookConsumerWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hook = useQuery$GetReviews();
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Reviews',
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: hook.refetch,
        child: GraphQLBuilder(
          builder: (result) {
            return ListView.separated(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ReviewCard(reviews: result.Page!.reviews![index]!);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 15,
              ),
              itemCount: result.Page!.reviews!.length,
            );
          },
          hook: hook,
          loadingBuilder: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.sunsetOrange,
              ),
            );
          },
        ),
      ),
    );
  }
}
