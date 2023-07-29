import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/graphql.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/features/home/widgets/upcoming_episode_card.dart';
import 'package:otaku_world/graphql/__generated/features/home/graphql/upcoming_episodes.graphql.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:otaku_world/utils/ui_utils.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var upcomingEpisodesHook = useQuery$GetUpcomingEpisodes();

    return Column(
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
      ],
    );
  }

  Widget _buildUpcomingEpisodesSection(BuildContext context, QueryHookResult<Query$GetUpcomingEpisodes> hook) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Upcoming Episodes',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontFamily: 'Roboto Condensed',
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
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Widget _buildUpcomingEpisodesList(List<Query$GetUpcomingEpisodes$Page$media?>? mediaList) {
    final List<Color> cardColors = [
      AppColors.sunsetOrange,
      AppColors.crayola,
      AppColors.kiwi,
    ];

    return ListView.builder(
      itemCount: 10,
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
