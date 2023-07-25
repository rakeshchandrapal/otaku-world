import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:otaku_world/constants/assets_constants.dart';
import 'package:otaku_world/theme/colors.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otaku World'),
      ),
      body: child,
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          currentIndex: _calculateSelectedIndex(context),
          onTap: (value) => onTap(value, context),
          items: [
            _buildBottomNavBarItem(label: 'Home', icon: AssetsConstants.home,),
            _buildBottomNavBarItem(label: 'Discover', icon: AssetsConstants.search,),
            _buildBottomNavBarItem(label: 'Social', icon: AssetsConstants.group,),
            _buildBottomNavBarItem(label: 'My List', icon: AssetsConstants.bulletList,),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({required String label, required String icon}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(
          icon,
          color: AppColors.white,
        ),
      ),
      label: label,
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset(
          icon,
          color: AppColors.sunsetOrange,
        ),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouterState route = GoRouterState.of(context);
    final String location = route.location;
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/discover')) {
      return 1;
    }
    if (location.startsWith('/social')) {
      return 2;
    }
    if (location.startsWith('/myList')) {
      return 3;
    }
    return 0;
  }

  void onTap(int value, BuildContext context) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/discover');
      case 2:
        return context.go('/social');
      case 3:
        return context.go('/myList');
      default:
        return context.go('/home');
    }
  }
}
