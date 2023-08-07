import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/controllers/media_grid_controller.dart';
import 'package:otaku_world/common/ui/media_grid_view.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

class TrendingAnimeScreen extends HookConsumerWidget {
  const TrendingAnimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var trendingAnimeHook = useQuery$GetTrendingAnime(
      Options$Query$GetTrendingAnime(
        variables: Variables$Query$GetTrendingAnime(
          page: ref.watch(trendingAnimeControllerProvider).pageCount,
        ),
      ),
    );

    var mediaList = ref.watch(trendingAnimeControllerProvider).mediaList;
    var scrollController = useScrollController();

    useEffect(() {
      MediaGridController listController =
      ref.read(trendingAnimeControllerProvider);
      scrollController.addListener(() {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          if (!listController.isLoading &&
              !trendingAnimeHook.result.isLoading) {
            if (ref.read(trendingAnimeControllerProvider).hasNextPage) {
              listController.toggleIsLoading();
              listController.incrementPageCount();
            }
          }
        }
      });
      return null;
    });

    useEffect(() {
      if (trendingAnimeHook.result.data != null) {
        bool hasNextPage = trendingAnimeHook
            .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;

        ref
            .read(trendingAnimeControllerProvider)
            .setHasNextPage(hasNextPage);
        MediaGridController listController =
        ref.read(trendingAnimeControllerProvider);
        List<Fragment$MediaShort?> newMediaList =
        trendingAnimeHook.result.parsedData!.Page!.media!;
        if (listController.mediaList.length < listController.pageCount * 30 &&
            listController.mediaList.length % 30 == 0) {
          listController.addToMediaList(newMediaList);
        }
      }

      return null;
    }, [trendingAnimeHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Trending Anime',
      ),
      body: (trendingAnimeHook.result.isLoading && mediaList.isEmpty)
          ? const CircularProgressIndicator()
          : Center(
        child: Column(
          children: [
            MediaGridView(
              controller: scrollController,
              mediaList: mediaList,
            ),
            if (ref.watch(trendingAnimeControllerProvider).isLoading)
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
