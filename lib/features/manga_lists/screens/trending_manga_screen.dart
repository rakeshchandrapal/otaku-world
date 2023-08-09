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
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

import 'dart:developer' as dev;

import 'package:otaku_world/theme/colors.dart';

class TrendingMangaScreen extends HookConsumerWidget {
  const TrendingMangaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dev.log('Building the TrendingAnimeScreen', name: 'Data');
    var trendingMangaHook = useQuery$GetTrendingManga(
      Options$Query$GetTrendingManga(
        variables: Variables$Query$GetTrendingManga(
          page: 1,
        ),
      ),
    );

    var scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.offset > 0) {
          ref.read(trendingMangaTopPositionController.notifier).setAtTop(false);
        } else {
          ref.read(trendingMangaTopPositionController.notifier).setAtTop(true);
        }

        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          ref
              .read(trendingMangaBottomPositionController.notifier)
              .setAtBottom(true);
        } else {
          ref
              .read(trendingMangaBottomPositionController.notifier)
              .setAtBottom(false);
        }
      });

      return null;
    });

    useEffect(() {
      if (ref.read(trendingMangaController.notifier).pageCount == 1 &&
          trendingMangaHook.result.hasException) {
        dev.log('Got error: ${trendingMangaHook.result.exception}',
            name: 'Data');
        ref.read(trendingMangaController.notifier).setIsLoading(false);
        return;
      }

      if (ref.read(trendingMangaController.notifier).pageCount == 1 &&
          trendingMangaHook.result.isLoading) {
        dev.log('Hook is loading', name: 'Data');
        ref.read(trendingMangaController.notifier).setIsLoading(true);
        return;
      }

      dev.log('Hook data changed: ${trendingMangaHook.result.data}',
          name: 'Data');
      if (trendingMangaHook.result.data != null) {
        bool hasNextPage =
            trendingMangaHook.result.parsedData!.Page!.pageInfo!.hasNextPage ??
                false;
        int currentPage =
            trendingMangaHook.result.parsedData!.Page!.pageInfo!.currentPage!;

        if (currentPage == 1 &&
            ref.read(trendingMangaController.notifier).lastVisitedPage == 1) {
          ref
              .read(trendingMangaController.notifier)
              .setHasNextPage(hasNextPage);

          MediaGridControllerStateNotifier listController =
              ref.read(trendingMangaController.notifier);
          List<Fragment$MediaShort?> newMediaList =
              trendingMangaHook.result.parsedData!.Page!.media!;
          if (listController.mediaList.length <
                  listController.lastVisitedPage * 30 &&
              listController.mediaList.length % 30 == 0) {
            listController.addToMediaList(newMediaList);
          }
        } else {
          ref.read(trendingMangaController.notifier).setIsLoading(false);
        }
      }

      return null;
    }, [trendingMangaHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Trending Anime',
      ),
      body: (trendingMangaHook.result.hasException &&
              ref.read(trendingMangaController.notifier).mediaList.isEmpty)
          ? Center(
              child: ErrorText(
                text: 'Some error occurred! Please try again!',
                onPressed: trendingMangaHook.refetch,
              ),
            )
          // If there's no error and hook is fetching data (loading) and also list is empty (first time fetching data) show progress indicator
          : (ref.watch(trendingMangaController) &&
                  ref
                      .watch(trendingMangaController.notifier)
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
                        .read(trendingMangaController.notifier)
                        .resetController();
                    trendingMangaHook.refetch();
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        MediaGridView(
                          controller: scrollController,
                          mediaList: ref
                              .watch(trendingMangaController.notifier)
                              .mediaList,
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Visibility(
                            visible: ref.watch(
                                    trendingMangaBottomPositionController) &&
                                ref
                                    .watch(trendingMangaController.notifier)
                                    .hasNextPage,
                            child: ref.watch(trendingMangaController)
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
                                        fetchMoreData(ref, trendingMangaHook);
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
        visible: !ref.watch(trendingMangaTopPositionController),
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
    QueryHookResult<Query$GetTrendingManga> hook,
  ) {
    if (!ref.read(trendingMangaController)) {
      dev.log('Fetching more data from hook', name: 'Data');
      ref.read(trendingMangaController.notifier).incrementPageCount();
      hook
          .fetchMore(
            FetchMoreOptions$Query$GetTrendingManga(
              variables: Variables$Query$GetTrendingManga(
                page: ref.read(trendingMangaController.notifier).pageCount,
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
                      .read(trendingMangaController.notifier)
                      .setLastVisitedPage(currentPage);
                  ref
                      .read(trendingMangaController.notifier)
                      .setHasNextPage(hasNextPage);
                  ref
                      .read(trendingMangaController.notifier)
                      .addToMediaList(newMediaList);

                  ref
                      .read(trendingMangaBottomPositionController.notifier)
                      .setAtBottom(false);
                } else {
                  dev.log('Data is null', name: 'Data');
                  ref
                      .read(trendingMangaController.notifier)
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
