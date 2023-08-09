import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/common/ui/main_app_bar.dart';
import 'package:otaku_world/common/ui/media_section.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/features/home/widgets/feature_card.dart';
import 'package:otaku_world/features/home/widgets/upcoming_episode_card.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/upcoming_episodes.graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:otaku_world/utils/ui_utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var upcomingEpisodesHook = useQuery$GetUpcomingEpisodes();
    var recommendedAnimeHook = useQuery$GetRecommendedAnime(
      Options$Query$GetRecommendedAnime(
        variables: Variables$Query$GetRecommendedAnime(
          page: 1,
          categories:
              ref.watch(sharedPreferencesProvider).getStringList('categories'),
        ),
      ),
    );
    var recommendedMangaHook = useQuery$GetRecommendedManga(
      Options$Query$GetRecommendedManga(
        variables: Variables$Query$GetRecommendedManga(
          page: 1,
          categories:
              ref.watch(sharedPreferencesProvider).getStringList('categories'),
        ),
      ),
    );
    var trendingAnimeHook = useQuery$GetTrendingAnime(
      Options$Query$GetTrendingAnime(
        variables: Variables$Query$GetTrendingAnime(
          page: 1,
        ),
      ),
    );
    var trendingMangaHook = useQuery$GetTrendingManga(
      Options$Query$GetTrendingManga(
        variables: Variables$Query$GetTrendingManga(
          page: 1,
        ),
      ),
    );

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(appBarNotifierProvider).triggerAppBarRebuild();
        upcomingEpisodesHook.refetch();
        recommendedAnimeHook.refetch();
        recommendedMangaHook.refetch();
        trendingAnimeHook.refetch();
        trendingMangaHook.refetch();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            // Search Option
            _buildSearchOption(context),
            const SizedBox(
              height: 15,
            ),
            _buildUpcomingEpisodesSection(context, upcomingEpisodesHook),
            const SizedBox(
              height: 15,
            ),
            // Reviews feature card
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: FeatureCard(
                onTap: () {
                  showSnackBar(context, 'Coming soon..');
                },
                heading: HomeConstants.reviewsHeading,
                subheading: HomeConstants.reviewsSubheading,
                icon: AssetsConstants.chatBubble,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Calendar feature card
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: FeatureCard(
                onTap: () {
                  showSnackBar(context, 'Coming soon..');
                },
                heading: HomeConstants.calendarHeading,
                subheading: HomeConstants.calendarSubheading,
                icon: AssetsConstants.calendar,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Recommended Anime Section
            MediaSection(
              hook: recommendedAnimeHook,
              sectionHeader: 'Recommended Anime',
              onMorePressed: () {
                context.push('/recommendedAnime');
              },
              onSliderPressed: () {
                recommendedAnimeHook.refetch();
                context.push(
                  '/mediaSlider/Recommended Anime',
                  extra: recommendedAnimeHook.result.parsedData?.Page?.media,
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            // Trending Anime Section
            MediaSection(
              hook: trendingAnimeHook,
              sectionHeader: 'Trending Anime',
              onMorePressed: () {
                context.push('/trendingAnime');
              },
              onSliderPressed: () {
                trendingAnimeHook.refetch();
                context.push(
                  '/mediaSlider/Trending Anime',
                  extra: trendingAnimeHook.result.parsedData?.Page?.media,
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            // Recommended Manga Section
            MediaSection(
              hook: recommendedMangaHook,
              sectionHeader: 'Recommended Manga',
              onMorePressed: () {
                context.push('/recommendedManga');
              },
              onSliderPressed: () {
                recommendedMangaHook.refetch();
                context.push(
                  '/mediaSlider/Recommended Manga',
                  extra: recommendedMangaHook.result.parsedData?.Page?.media,
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            // Trending Manga Section
            MediaSection(
              hook: trendingMangaHook,
              sectionHeader: 'Trending Manga',
              onMorePressed: () {
                context.push('/trendingManga');
              },
              onSliderPressed: () {
                trendingMangaHook.refetch();
                context.push(
                  '/mediaSlider/Trending Manga',
                  extra: trendingMangaHook.result.parsedData?.Page?.media,
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEpisodesSection(
      BuildContext context, QueryHookResult<Query$GetUpcomingEpisodes> hook,) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Upcoming Episodes',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontFamily: 'Roboto-Condensed',
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        GraphQLBuilder(
          hook: hook,
          builder: (result) {
            return Container(
              height: 150,
              padding: const EdgeInsets.only(
                left: 15,
                top: 12,
              ),
              child: _buildUpcomingEpisodesList(result.Page!.media),
            );
          },
          loadingBuilder: () {
            return const CircularProgressIndicator(
              color: AppColors.sunsetOrange,
            );
          },
        ),
      ],
    );
  }

  Widget _buildUpcomingEpisodesList(
      List<Query$GetUpcomingEpisodes$Page$media?>? mediaList) {
    final List<Color> cardColors = [
      AppColors.sunsetOrange,
      AppColors.crayola,
      AppColors.kiwi,
    ];

    return ListView.builder(
      itemCount: 10,
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return UpcomingEpisodeCard(
          color: cardColors[index % cardColors.length],
          media: mediaList![index],
        );
      },
    );
  }

  Widget _buildSearchOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: InkWell(
        onTap: () {
          showSnackBar(context, 'Coming soon...');
        },
        child: Container(
          height: 50,
          decoration: ShapeDecoration(
            color: AppColors.jet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              SvgPicture.asset(AssetsConstants.searchSmall),
              const SizedBox(
                width: 10,
              ),
              Text(
                HomeConstants.discover,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.white.withOpacity(0.5),
                      fontFamily: 'Poppins',
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
