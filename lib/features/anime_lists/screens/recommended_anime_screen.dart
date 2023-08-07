import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/controllers/media_grid_controller.dart';
import 'package:otaku_world/common/ui/media_grid_view.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

class RecommendedAnimeScreen extends HookConsumerWidget {
  const RecommendedAnimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var recommendedAnimeHook = useQuery$GetRecommendedAnime(
      Options$Query$GetRecommendedAnime(
        variables: Variables$Query$GetRecommendedAnime(
          page: ref.watch(recommendedAnimeControllerProvider).pageCount,
          categories:
              ref.read(sharedPreferencesProvider).getStringList('categories'),
        ),
      ),
    );

    var mediaList = ref.watch(recommendedAnimeControllerProvider).mediaList;
    var scrollController = useScrollController();

    useEffect(() {
      MediaGridController listController =
          ref.read(recommendedAnimeControllerProvider);
      scrollController.addListener(() {
        if (scrollController.position.atEdge &&
            scrollController.position.pixels != 0) {
          if (!listController.isLoading &&
              !recommendedAnimeHook.result.isLoading) {
            if (ref.read(recommendedAnimeControllerProvider).hasNextPage) {
              listController.toggleIsLoading();
              listController.incrementPageCount();
            }
          }
        }
      });
      return null;
    });

    useEffect(() {
      if (recommendedAnimeHook.result.data != null) {
        bool hasNextPage = recommendedAnimeHook
                .result.parsedData!.Page!.pageInfo!.hasNextPage ??
            false;

        ref
            .read(recommendedAnimeControllerProvider)
            .setHasNextPage(hasNextPage);
        MediaGridController listController =
            ref.read(recommendedAnimeControllerProvider);
        List<Fragment$MediaShort?> newMediaList =
            recommendedAnimeHook.result.parsedData!.Page!.media!;
        if (listController.mediaList.length < listController.pageCount * 30 &&
            listController.mediaList.length % 30 == 0) {
          listController.addToMediaList(newMediaList);
        }
      }

      return null;
    }, [recommendedAnimeHook.result.data]);

    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Recommended Anime',
      ),
      body: (recommendedAnimeHook.result.isLoading && mediaList.isEmpty)
          ? const CircularProgressIndicator()
          : Center(
              child: Column(
                children: [
                  MediaGridView(
                    controller: scrollController,
                    mediaList: mediaList,
                  ),
                  if (ref.watch(recommendedAnimeControllerProvider).isLoading)
                    const CircularProgressIndicator()
                ],
              ),
            ),
    );
  }
}
