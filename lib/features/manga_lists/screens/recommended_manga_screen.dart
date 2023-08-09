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
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

import 'dart:developer' as dev;

import 'package:otaku_world/theme/colors.dart';

class RecommendedMangaScreen extends HookConsumerWidget {
  const RecommendedMangaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('Building the RecommendedMangaScreen', name: 'Data');

    final categories =
        ref.read(sharedPreferencesProvider).getStringList('categories');
    var recommendedMangaHook = useQuery$GetRecommendedManga(
      Options$Query$GetRecommendedManga(
        variables: Variables$Query$GetRecommendedManga(
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
              .read(recommendedMangaTopPositionController.notifier)
              .setAtTop(false);
        } else {
          ref
              .read(recommendedMangaTopPositionController.notifier)
              .setAtTop(true);
        }

        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          ref
              .read(recommendedMangaBottomPositionController.notifier)
              .setAtBottom(true);
        } else {
          ref
              .read(recommendedMangaBottomPositionController.notifier)
              .setAtBottom(false);
        }
      });

      return null;
    });

    useEffect(() {
      if (ref.read(recommendedMangaController.notifier).pageCount == 1 &&
          recommendedMangaHook.result.hasException) {
        dev.log('Got error: ${recommendedMangaHook.result.exception}',
            name: 'Data');
        ref.read(recommendedMangaController.notifier).setIsLoading(false);
        return;
      }

      if (ref.read(recommendedMangaController.notifier).pageCount == 1 &&
          recommendedMangaHook.result.isLoading) {
        dev.log('Hook is loading', name: 'Data');
        ref.read(recommendedMangaController.notifier).setIsLoading(true);
        return;
      }

      dev.log('Hook data changed: ${recommendedMangaHook.result.data}',
          name: 'Data');
      if (recommendedMangaHook.result.data != null) {
        bool hasNextPage = recommendedMangaHook
                .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;
        int currentPage = recommendedMangaHook
            .result.parsedData!.Page!.pageInfo!.currentPage!;

        if (currentPage == 1 &&
            ref.read(recommendedMangaController.notifier).lastVisitedPage ==
                1) {
          ref
              .read(recommendedMangaController.notifier)
              .setHasNextPage(hasNextPage);

          MediaGridControllerStateNotifier listController =
              ref.read(recommendedMangaController.notifier);
          List<Fragment$MediaShort?> newMediaList =
              recommendedMangaHook.result.parsedData!.Page!.media!;
          if (listController.mediaList.length <
                  listController.lastVisitedPage * 30 &&
              listController.mediaList.length % 30 == 0) {
            listController.addToMediaList(newMediaList);
          }
        } else {
          ref.read(recommendedMangaController.notifier).setIsLoading(false);
        }
      }

      return null;
    }, [recommendedMangaHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Recommended Manga',
      ),
      body: (recommendedMangaHook.result.hasException &&
              ref.read(recommendedMangaController.notifier).mediaList.isEmpty)
          ? Center(
              child: ErrorText(
                text: 'Some error occurred! Please try again!',
                onPressed: recommendedMangaHook.refetch,
              ),
            )
          // If there's no error and hook is fetching data (loading) and also list is empty (first time fetching data) show progress indicator
          : (ref.watch(recommendedMangaController) &&
                  ref
                      .watch(recommendedMangaController.notifier)
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
                        .read(recommendedMangaController.notifier)
                        .resetController();
                    recommendedMangaHook.refetch();
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        MediaGridView(
                          controller: scrollController,
                          mediaList: ref
                              .watch(recommendedMangaController.notifier)
                              .mediaList,
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Visibility(
                            visible: ref.watch(
                                    recommendedMangaBottomPositionController) &&
                                ref
                                    .watch(recommendedMangaController.notifier)
                                    .hasNextPage,
                            child: ref.watch(recommendedMangaController)
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
                                          recommendedMangaHook,
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
        visible: !ref.watch(recommendedMangaTopPositionController),
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
    QueryHookResult<Query$GetRecommendedManga> hook,
    List<String> categories,
  ) {
    if (!ref.read(recommendedMangaController)) {
      dev.log('Fetching more data from hook', name: 'Data');
      ref.read(recommendedMangaController.notifier).incrementPageCount();
      hook
          .fetchMore(
            FetchMoreOptions$Query$GetRecommendedManga(
              variables: Variables$Query$GetRecommendedManga(
                page: ref.read(recommendedMangaController.notifier).pageCount,
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
                      .read(recommendedMangaController.notifier)
                      .setLastVisitedPage(currentPage);
                  ref
                      .read(recommendedMangaController.notifier)
                      .setHasNextPage(hasNextPage);
                  ref
                      .read(recommendedMangaController.notifier)
                      .addToMediaList(newMediaList);

                  ref
                      .read(recommendedMangaBottomPositionController.notifier)
                      .setAtBottom(false);
                } else {
                  dev.log('Data is null', name: 'Data');
                  ref
                      .read(recommendedMangaController.notifier)
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
