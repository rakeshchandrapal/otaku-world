import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/controllers/media_grid_controller.dart';
import 'package:otaku_world/common/ui/media_grid_view.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

class RecommendedMangaScreen extends HookConsumerWidget {
  const RecommendedMangaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var recommendedMangaHook = useQuery$GetRecommendedManga(
      Options$Query$GetRecommendedManga(
        variables: Variables$Query$GetRecommendedManga(
          page: ref.watch(recommendedMangaControllerProvider).pageCount,
          categories:
          ref.read(sharedPreferencesProvider).getStringList('categories'),
        ),
      ),
    );

    var mediaList = ref.watch(recommendedMangaControllerProvider).mediaList;
    var scrollController = useScrollController();

    useEffect(() {
      MediaGridController listController =
      ref.read(recommendedMangaControllerProvider);
      scrollController.addListener(() {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          if (!listController.isLoading &&
              !recommendedMangaHook.result.isLoading) {
            if (ref.read(recommendedMangaControllerProvider).hasNextPage) {
              listController.toggleIsLoading();
              listController.incrementPageCount();
            }
          }
        }
      });
      return null;
    });

    useEffect(() {
      if (recommendedMangaHook.result.data != null) {
        bool hasNextPage = recommendedMangaHook
            .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;

        ref
            .read(recommendedMangaControllerProvider)
            .setHasNextPage(hasNextPage);
        MediaGridController listController =
        ref.read(recommendedMangaControllerProvider);
        List<Fragment$MediaShort?> newMediaList =
        recommendedMangaHook.result.parsedData!.Page!.media!;
        if (listController.mediaList.length < listController.pageCount * 30 &&
            listController.mediaList.length % 30 == 0) {
          listController.addToMediaList(newMediaList);
        }
      }

      return null;
    }, [recommendedMangaHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Recommended Manga',
      ),
      body: (recommendedMangaHook.result.isLoading && mediaList.isEmpty)
          ? const CircularProgressIndicator()
          : Center(
        child: Column(
          children: [
            MediaGridView(
              controller: scrollController,
              mediaList: mediaList,
            ),
            if (ref.watch(recommendedMangaControllerProvider).isLoading)
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
