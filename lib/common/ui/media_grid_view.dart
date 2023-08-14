import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';
import 'package:otaku_world/graphql/__generated/schema.graphql.dart';
import 'package:otaku_world/theme/colors.dart';

import '../../services/caching/image_cache_manager.dart';

class MediaGridView extends StatelessWidget {
  const MediaGridView(
      {super.key,
      required this.controller,
      this.crossAxisCount = 3,
      required this.mediaList});

  final ScrollController controller;
  final List<Fragment$MediaShort?> mediaList;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 60,),
        shrinkWrap: true,
        controller: controller,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.57,
        ),
        scrollDirection: Axis.vertical,
        itemCount: mediaList.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    _buildMediaPoster(
                      mediaList[index]?.coverImage?.large,
                      mediaList[index]!.type!,
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
                  width: 100,
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

  Widget _buildMediaPoster(String? imageUrl, Enum$MediaType type) {
    return (imageUrl != null)
        ? CachedNetworkImage(
            cacheManager: ImageCacheManager.instance,
            imageUrl: imageUrl,
            width: 110,
            height: 162,
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
            errorWidget: (context, url, error) {
              return _buildPlaceholderImage110x162(type);
            },
            placeholder: (context, url) {
              return _buildPlaceholderImage110x162(type);
            },
          )
        : _buildPlaceholderImage110x162(type);
  }

  Widget _buildPlaceholderImage110x162(Enum$MediaType type) {
    return ClipRRect(
      borderRadius: (type == Enum$MediaType.ANIME)
          ? BorderRadius.circular(15)
          : BorderRadius.circular(0),
      child: Image.asset(AssetsConstants.placeHolderImage110x162),
    );
  }
}
