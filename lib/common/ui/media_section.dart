import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/recommended_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_anime.graphql.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/trending_manga.graphql.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/graphql/__generated/schema.graphql.dart';
import 'package:otaku_world/services/caching/image_cache_manager.dart';
import 'package:otaku_world/theme/colors.dart';

class MediaSection<T> extends StatelessWidget {
  const MediaSection({
    super.key,
    required this.hook,
    required this.sectionHeader,
    this.leftPadding = 15,
    required this.onSliderPressed,
    required this.onMorePressed,
  });

  final QueryHookResult<T> hook;
  final String sectionHeader;
  final double leftPadding;
  final VoidCallback onSliderPressed;
  final VoidCallback onMorePressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: EdgeInsets.only(
              right: leftPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    sectionHeader,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontFamily: 'Roboto-Condensed',
                        ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: onSliderPressed,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 10,
                        ),
                        child: SvgPicture.asset(AssetsConstants.viewSlider),
                      ),
                    ),
                    InkWell(
                      onTap: onMorePressed,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 10,
                        ),
                        child: SvgPicture.asset(AssetsConstants.arrowRight),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Media list
          GraphQLBuilder(
            hook: hook,
            builder: (result) {
              if (result is Query$GetRecommendedAnime) {
                final recommendedAnimeList = result.Page!.media;

                return (recommendedAnimeList == null)
                    ? const SizedBox()
                    : MediaListBuilder(
                        mediaList: recommendedAnimeList,
                        type: Enum$MediaType.ANIME,
                      );
              } else if (result is Query$GetTrendingAnime) {
                final trendingAnimeList = result.Page!.media;

                return (trendingAnimeList == null)
                    ? const SizedBox()
                    : MediaListBuilder(
                        mediaList: trendingAnimeList,
                        type: Enum$MediaType.ANIME,
                      );
              } else if (result is Query$GetRecommendedManga) {
                final recommendedMangaList = result.Page!.media;

                return (recommendedMangaList == null)
                    ? const SizedBox()
                    : MediaListBuilder(
                        mediaList: recommendedMangaList,
                        type: Enum$MediaType.MANGA,
                      );
              } else if (result is Query$GetTrendingManga) {
                final trendingMangaList = result.Page!.media;

                return (trendingMangaList == null)
                    ? const SizedBox()
                    : MediaListBuilder(
                        mediaList: trendingMangaList,
                        type: Enum$MediaType.MANGA,
                      );
              } else {
                return const SizedBox();
              }
            },
            loadingBuilder: () {
              return const CircularProgressIndicator(
                color: AppColors.sunsetOrange,
              );
            },
          ),
        ],
      ),
    );
  }
}

class MediaListBuilder extends StatelessWidget {
  const MediaListBuilder({
    super.key,
    required this.mediaList,
    required this.type,
  });

  final List<Fragment$MediaShort?> mediaList;
  final Enum$MediaType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205,
      child: ListView.builder(
        itemCount: mediaList.length,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              right: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    _buildMediaPoster(
                      mediaList[index]?.coverImage?.large,
                    ),
                    // Mean score
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: _buildMeanScore(
                        context,
                        mediaList[index]?.meanScore,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                // Manga title
                SizedBox(
                  width: 115,
                  child: Text(
                    getTitle(mediaList[index]?.title) ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: 'Roboto-Condensed',
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String? getTitle(Fragment$MediaShort$title? title) {
    return title?.english ?? title?.romaji ?? title?.native;
  }

  Widget _buildMeanScore(BuildContext context, int? meanScore) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 3,
      ),
      decoration: const ShapeDecoration(
        color: AppColors.raisinBlack,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetsConstants.star),
          const SizedBox(
            width: 1,
          ),
          Text(
            (meanScore == null) ? '0' : meanScore.toString(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: 'Roboto-Condensed',
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildMediaPoster(String? imageUrl) {
    return (imageUrl != null)
        ? CachedNetworkImage(
            cacheManager: ImageCacheManager.instance,
            imageUrl: imageUrl,
            width: 115,
            height: 169,
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) {
              return ClipRRect(
                borderRadius: (type == Enum$MediaType.ANIME)
                    ? BorderRadius.circular(15)
                    : BorderRadius.circular(0),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              );
            },
            placeholder: (context, url) {
              return _buildPlaceholderImage115x169();
            },
          )
        : _buildPlaceholderImage115x169();
  }

  Widget _buildPlaceholderImage115x169() {
    return ClipRRect(
      borderRadius: (type == Enum$MediaType.ANIME)
          ? BorderRadius.circular(15)
          : BorderRadius.circular(0),
      child: Image.asset(AssetsConstants.placeHolderImage115x169),
    );
  }
}

abstract class MediaSectionItem {
  String get imageUrl;

  String get title;

  int get meanScore;
}
