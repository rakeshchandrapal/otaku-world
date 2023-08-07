import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/controllers/media_grid_controller.dart';
import 'package:otaku_world/common/ui/media_grid_view.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

class TrendingMangaScreen extends HookConsumerWidget {
  const TrendingMangaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var trendingMangaHook = useQuery$GetTrendingManga(
      Options$Query$GetTrendingManga(
        variables: Variables$Query$GetTrendingManga(
          page: ref.watch(trendingMangaControllerProvider).pageCount,
        ),
      ),
    );

    var mediaList = ref.watch(trendingMangaControllerProvider).mediaList;
    var scrollController = useScrollController();

    useEffect(() {
      MediaGridController listController =
      ref.read(trendingMangaControllerProvider);
      scrollController.addListener(() {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          if (!listController.isLoading &&
              !trendingMangaHook.result.isLoading) {
            if (ref.read(trendingMangaControllerProvider).hasNextPage) {
              listController.toggleIsLoading();
              listController.incrementPageCount();
            }
          }
        }
      });
      return null;
    });

    useEffect(() {
      if (trendingMangaHook.result.data != null) {
        bool hasNextPage = trendingMangaHook
            .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;

        ref
            .read(trendingMangaControllerProvider)
            .setHasNextPage(hasNextPage);
        MediaGridController listController =
        ref.read(trendingMangaControllerProvider);
        List<Fragment$MediaShort?> newMediaList =
        trendingMangaHook.result.parsedData!.Page!.media!;
        if (listController.mediaList.length < listController.pageCount * 30 &&
            listController.mediaList.length % 30 == 0) {
          listController.addToMediaList(newMediaList);
        }
      }

      return null;
    }, [trendingMangaHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Trending Manga',
      ),
      body: (trendingMangaHook.result.isLoading && mediaList.isEmpty)
          ? const CircularProgressIndicator()
          : Center(
        child: Column(
          children: [
            MediaGridView(
              controller: scrollController,
              mediaList: mediaList,
            ),
            if (ref.watch(trendingMangaControllerProvider).isLoading)
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
