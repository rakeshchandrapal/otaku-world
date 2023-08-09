import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/common/ui/primary_button.dart';
import 'package:otaku_world/common/ui/primary_outlined_button.dart';
import 'package:otaku_world/common/ui/simple_app_bar.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/constants/string_constants.dart';
import 'package:otaku_world/providers/graphql.dart';
import 'package:otaku_world/providers/shared_preferences.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri authUri = Uri(
  scheme: 'https',
  host: 'anilist.co',
  path: '/api/v2/oauth/authorize',
  query: 'client_id=13595&response_type=token',
);

final Uri registerUri = Uri(
  scheme: 'https',
  host: 'anilist.co',
  path: '/signup',
);

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  StreamSubscription? _sub;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(
        title: '',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetsConstants.appLogo),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(
                      LoginConstants.loginToAniListHeading,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Text(
                      LoginConstants.loginToAniListSubHeading,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontFamily: 'Poppins',
                            color: AppColors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    child: Text(
                      LoginConstants.registerText,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontFamily: 'Poppins',
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 55,
              ),
              PrimaryButton(
                onTap: () {
                  login();
                },
                label: 'Log In',
                horizontalPadding: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryOutlinedButton(
                onTap: () {
                  register();
                },
                label: 'Register',
                horizontalPadding: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void login() async {
    try {
      await _launchUrl(authUri);

      _sub?.cancel();
      _sub = uriLinkStream.listen((uri) async {
        dev.log('Uri: $uri', name: 'Auth');
        if (uri?.scheme == 'otakuworld') {
          var fragment = uri!.toString();
          dev.log('Fragment: $fragment', name: 'Auth');
          var start = fragment.indexOf('=');
          var middle = fragment.indexOf('&');
          var accessToken = fragment.substring(start + 1, middle);
          dev.log('Access token: $accessToken', name: 'Auth');

          dev.log('Storing access token', name: 'Auth');

          ref
              .read(sharedPreferencesProvider)
              .setString('access_token', accessToken)
              .then(
            (value) {
              dev.log('Stored token: $value', name: 'Auth');
              // Reset graphql client provider so authorized requests can be sent
              ref.read(graphQLProvider.notifier).reset();

              final categorySelected = ref
                  .read(sharedPreferencesProvider)
                  .getStringList('categories');
              if (categorySelected == null) {
                // Go to [CategorySelectionScreen]
                context.go('/categorySelection');
              } else {
                context.go('/home');
              }
            },
          );
        }
      });
    } catch (e) {
      dev.log('Got error: $e');
    }
  }
  
  void register() {
    _launchUrl(registerUri);
  }
}
