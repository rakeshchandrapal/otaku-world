import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

import 'dart:developer' as dev;

final recommendedMangaControllerProvider =
    ChangeNotifierProvider<MediaGridController>(
  (ref) {
    return MediaGridController();
  },
);

final recommendedAnimeControllerProvider =
    ChangeNotifierProvider<MediaGridController>(
  (ref) {
    return MediaGridController();
  },
);

final trendingAnimeControllerProvider =
    ChangeNotifierProvider<MediaGridController>(
  (ref) {
    return MediaGridController();
  },
);

final trendingMangaControllerProvider =
    ChangeNotifierProvider<MediaGridController>(
  (ref) {
    return MediaGridController();
  },
);

class MediaGridController extends ChangeNotifier {
  int pageCount = 1;
  List<Fragment$MediaShort?> mediaList = [];
  bool isLoading = false;
  bool hasNextPage = false;

  void resetController() {
    pageCount = 1;
    mediaList = [];
    notifyListeners();
  }

  void setHasNextPage(bool hasNextPage) {
    this.hasNextPage = hasNextPage;
    Future.delayed(const Duration(seconds: 5), () {
      dev.log('Has next page set to: ${this.hasNextPage}', name: 'Data');
      notifyListeners();
    },);
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void incrementPageCount() {
    pageCount++;
    dev.log('Page count: $pageCount');
    notifyListeners();
  }

  void addToMediaList(List<Fragment$MediaShort?> newMediaList) {
    mediaList.addAll(newMediaList);
    dev.log('Media list size: ${mediaList.length}');
    isLoading = false;
    Future.delayed(const Duration(seconds: 5), () {
      notifyListeners();
    },);
  }
}
