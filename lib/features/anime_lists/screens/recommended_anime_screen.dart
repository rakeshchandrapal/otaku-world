import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/controllers/media_grid_controller.dart';
import 'package:otaku_world/common/ui/error_text.dart';
import 'package:otaku_world/common/ui/media_grid_view.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

import 'dart:developer' as dev;

import 'package:otaku_world/theme/colors.dart';

class RecommendedAnimeScreen extends HookConsumerWidget {
  const RecommendedAnimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('Building the RecommendedAnimeScreen', name: 'Data');

    final categories =
        ref.read(sharedPreferencesProvider).getStringList('categories');
    var recommendedAnimeHook = useQuery$GetRecommendedAnime(
      Options$Query$GetRecommendedAnime(
        variables: Variables$Query$GetRecommendedAnime(
          page: 1,
          categories: categories,
        ),
      ),
    );

    var scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.offset > 0) {
          ref
              .read(recommendedAnimeTopPositionController.notifier)
              .setAtTop(false);
        } else {
          ref
              .read(recommendedAnimeTopPositionController.notifier)
              .setAtTop(true);
        }

        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          ref
              .read(recommendedAnimeBottomPositionController.notifier)
              .setAtBottom(true);
        } else {
          ref
              .read(recommendedAnimeBottomPositionController.notifier)
              .setAtBottom(false);
        }
      });

      return null;
    });

    useEffect(() {
      if (ref.read(recommendedAnimeController.notifier).pageCount == 1 &&
          recommendedAnimeHook.result.hasException) {
        dev.log('Got error: ${recommendedAnimeHook.result.exception}',
            name: 'Data');
        ref.read(recommendedAnimeController.notifier).setIsLoading(false);
        return;
      }

      if (ref.read(recommendedAnimeController.notifier).pageCount == 1 &&
          recommendedAnimeHook.result.isLoading) {
        dev.log('Hook is loading', name: 'Data');
        ref.read(recommendedAnimeController.notifier).setIsLoading(true);
        return;
      }

      dev.log('Hook data changed: ${recommendedAnimeHook.result.data}',
          name: 'Data');
      if (recommendedAnimeHook.result.data != null) {
        bool hasNextPage = recommendedAnimeHook
                .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;
        int currentPage = recommendedAnimeHook
            .result.parsedData!.Page!.pageInfo!.currentPage!;

        if (currentPage == 1 &&
            ref.read(recommendedAnimeController.notifier).lastVisitedPage ==
                1) {
          ref
              .read(recommendedAnimeController.notifier)
              .setHasNextPage(hasNextPage);

          MediaGridControllerStateNotifier listController =
              ref.read(recommendedAnimeController.notifier);
          List<Fragment$MediaShort?> newMediaList =
              recommendedAnimeHook.result.parsedData!.Page!.media!;
          if (listController.mediaList.length <
                  listController.lastVisitedPage * 30 &&
              listController.mediaList.length % 30 == 0) {
            listController.addToMediaList(newMediaList);
          }
        } else {
          ref.read(recommendedAnimeController.notifier).setIsLoading(false);
        }
      }

      return null;
    }, [recommendedAnimeHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Recommended Anime',
      ),
      body: (recommendedAnimeHook.result.hasException &&
              ref.read(recommendedAnimeController.notifier).mediaList.isEmpty)
          ? Center(
              child: ErrorText(
                text: 'Some error occurred! Please try again!',
                onPressed: recommendedAnimeHook.refetch,
              ),
            )
          // If there's no error and hook is fetching data (loading) and also list is empty (first time fetching data) show progress indicator
          : (ref.watch(recommendedAnimeController) &&
                  ref
                      .watch(recommendedAnimeController.notifier)
                      .mediaList
                      .isEmpty)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.sunsetOrange,
                  ),
                )
              // If there's no error and hook is not fetching data first time show our anime list
              : RefreshIndicator(
                  color: AppColors.sunsetOrange,
                  backgroundColor: AppColors.raisinBlack,
                  onRefresh: () async {
                    ref
                        .read(recommendedAnimeController.notifier)
                        .resetController();
                    recommendedAnimeHook.refetch();
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        MediaGridView(
                          controller: scrollController,
                          mediaList: ref
                              .watch(recommendedAnimeController.notifier)
                              .mediaList,
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Visibility(
                            visible: ref.watch(
                                    recommendedAnimeBottomPositionController) &&
                                ref
                                    .watch(recommendedAnimeController.notifier)
                                    .hasNextPage,
                            child: ref.watch(recommendedAnimeController)
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.sunsetOrange,
                                    ),
                                  )
                                : SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width - 20,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        fetchMoreData(
                                          ref,
                                          recommendedAnimeHook,
                                          categories ?? [],
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.sunsetOrange
                                            .withOpacity(0.65),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        'Load More',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
      floatingActionButton: Visibility(
        visible: !ref.watch(recommendedAnimeTopPositionController),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 40,
          ),
          child: FloatingActionButton.small(
            onPressed: () {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            elevation: 0,
            backgroundColor: AppColors.sunsetOrange.withOpacity(0.75),
            child: SvgPicture.asset(AssetsConstants.arrowUp),
          ),
        ),
      ),
    );
  }

  void fetchMoreData(
    WidgetRef ref,
    QueryHookResult<Query$GetRecommendedAnime> hook,
    List<String> categories,
  ) {
    if (!ref.read(recommendedAnimeController)) {
      dev.log('Fetching more data from hook', name: 'Data');
      ref.read(recommendedAnimeController.notifier).incrementPageCount();
      hook
          .fetchMore(
            FetchMoreOptions$Query$GetRecommendedAnime(
              variables: Variables$Query$GetRecommendedAnime(
                page: ref.read(recommendedAnimeController.notifier).pageCount,
                categories: categories,
              ),
              updateQuery: (previousResultData, fetchMoreResultData) {
                if (fetchMoreResultData != null) {
                  bool hasNextPage =
                      fetchMoreResultData['Page']['pageInfo']['hasNextPage'];
                  int currentPage =
                      fetchMoreResultData['Page']['pageInfo']['currentPage'];
                  List<Fragment$MediaShort?> newMediaList =
                      (fetchMoreResultData['Page']['media'] as List<dynamic>)
                          .map(
                    (e) {
                      return Fragment$MediaShort.fromJson(
                        e as Map<String, dynamic>,
                      );
                    },
                  ).toList();

                  ref
                      .read(recommendedAnimeController.notifier)
                      .setLastVisitedPage(currentPage);
                  ref
                      .read(recommendedAnimeController.notifier)
                      .setHasNextPage(hasNextPage);
                  ref
                      .read(recommendedAnimeController.notifier)
                      .addToMediaList(newMediaList);

                  ref
                      .read(recommendedAnimeBottomPositionController.notifier)
                      .setAtBottom(false);
                } else {
                  dev.log('Data is null', name: 'Data');
                  ref
                      .read(recommendedAnimeController.notifier)
                      .decreasePageCount();
                  // ref.read(trendingAnimeController.notifier).setIsLoading(false);
                }

                return fetchMoreResultData;
              },
            ),
          )
          .then((value) => dev.log(value.exception.toString(), name: 'Data'));
    } else {}
  }
}
