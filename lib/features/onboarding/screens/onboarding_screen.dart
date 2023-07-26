import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/common/ui/primary_button.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/features/onboarding/widgets/next_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/providers/shared_preferences.dart';

import 'package:otaku_world/theme/colors.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final pageImages = [
    AssetsConstants.onBoarding1,
    AssetsConstants.onBoarding2,
    AssetsConstants.onBoarding3,
    AssetsConstants.onBoarding4,
  ];

  final pageHeadings = [
    OnBoardingConstants.page1Heading,
    OnBoardingConstants.page2Heading,
    OnBoardingConstants.page3Heading,
    OnBoardingConstants.page4Heading,
  ];

  final pageSubheadings = [
    OnBoardingConstants.page1Subheading,
    OnBoardingConstants.page2Subheading,
    OnBoardingConstants.page3Subheading,
    OnBoardingConstants.page4Subheading,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return _buildWelcomePage(
                context: context,
                imagePath: pageImages[index],
                heading: pageHeadings[index],
                subheading: pageSubheadings[index],
              );
            },
          ),
          (_pageIndex == 3)
              // If user is at final page then 'Get Started' button will show up which will take him/her to the login page
              ? Positioned(
                  bottom: 45,
                  child: PrimaryButton(
                    onTap: () {
                      ref
                          .read(sharedPreferencesProvider)
                          .setBool('is_first_time', false);
                      context.push('/login');
                    },
                    label: 'Get Started',
                  ),
                )
              : Positioned(
                  bottom: 45,
                  left: 12,
                  right: 25,
                  child: Row(
                    children: [
                      ...List.generate(
                        4,
                        (index) {
                          if (index == _pageIndex) {
                            // Build bigger dot
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                width: 30,
                                height: 8,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [
                                      AppColors.sunsetOrange,
                                      AppColors.japaneseIndigo,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            );
                          } else {
                            // Build smaller dots
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 5,
                              ),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.chineseWhite,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      // const SizedBox(
                      //   width: 190,
                      // ),
                      const Spacer(),
                      NextButton(
                        onTap: () {
                          // It'll take user to the next page
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }

  // Utility function to build welcome screen page
  Widget _buildWelcomePage({
    required BuildContext context,
    required String imagePath,
    required String heading,
    required String subheading,
  }) {
    return Container(
      color: AppColors.blackOlive,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.1, 1.0],
                  colors: [
                    AppColors.raisinBlack.withOpacity(0.0),
                    AppColors.raisinBlack.withOpacity(0.6),
                    AppColors.raisinBlack.withOpacity(0.8),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 320,
                      child: Text(
                        heading,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontFamily: 'Poppins-Semi-Bold',
                                ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(
                        subheading,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontFamily: 'Poppins',
                                ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
