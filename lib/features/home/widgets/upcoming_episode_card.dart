import 'package:flutter/material.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/upcoming_episodes.graphql.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:otaku_world/utils/formatting_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UpcomingEpisodeCard extends StatelessWidget {
  const UpcomingEpisodeCard(
      {super.key, required this.color, required this.media});

  final Color color;
  final Query$GetUpcomingEpisodes$Page$media? media;

  @override
  Widget build(BuildContext context) {
    return (media == null)
        ? const SizedBox()
        : Container(
            width: 215,
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 8,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [color, AppColors.japaneseIndigo],
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
                SizedBox(
                  width: 106,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Text(
                          media!.title!.english ??
                              media!.title!.romaji ??
                              media!.title!.native!,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontFamily: 'Roboto-Medium',
                                  ),
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        'Ep. ${media!.airingSchedule!.nodes![0]!.episode} in'
                        '\n${formatDurationFromSeconds(media!.airingSchedule!.nodes![0]!.timeUntilAiring)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightSilver,
                            ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                // Anime Poster
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 5),
                  child: media!.coverImage?.large == null
                      ? _buildPlaceholderImage85x120()
                      : CachedNetworkImage(
                          imageUrl: media!.coverImage!.large!,
                          width: 85,
                          height: 120,
                          imageBuilder: (context, imageProvider) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                          placeholder: (context, url) => _buildPlaceholderImage85x120(),
                          errorWidget: (context, url, error) => _buildPlaceholderImage85x120(),
                        ),
                ),
              ],
            ),
          );
  }

  Widget _buildPlaceholderImage85x120() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(AssetsConstants.placeHolderImage85x120),
    );
  }
}
