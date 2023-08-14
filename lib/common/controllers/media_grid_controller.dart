import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otaku_world/graphql/__generated/graphql/fragments.graphql.dart';

import 'dart:developer' as dev;

// For recommended anime screen
final recommendedAnimeController =
    StateNotifierProvider<MediaGridControllerStateNotifier, bool>((ref) {
  return MediaGridControllerStateNotifier();
});

final recommendedAnimeTopPositionController =
    StateNotifierProvider<MediaGridTopPositionController, bool>((ref) {
  return MediaGridTopPositionController();
});

final recommendedAnimeBottomPositionController =
    StateNotifierProvider<MediaGridBottomPositionController, bool>((ref) {
  return MediaGridBottomPositionController();
});

// For trending anime screen
final trendingAnimeController =
    StateNotifierProvider<MediaGridControllerStateNotifier, bool>((ref) {
  return MediaGridControllerStateNotifier();
});

final trendingAnimeTopPositionController =
    StateNotifierProvider<MediaGridTopPositionController, bool>((ref) {
  return MediaGridTopPositionController();
});

final trendingAnimeBottomPositionController =
    StateNotifierProvider<MediaGridBottomPositionController, bool>((ref) {
  return MediaGridBottomPositionController();
});

// For recommended manga screen
final recommendedMangaController =
    StateNotifierProvider<MediaGridControllerStateNotifier, bool>((ref) {
  return MediaGridControllerStateNotifier();
});

final recommendedMangaTopPositionController =
    StateNotifierProvider<MediaGridTopPositionController, bool>((ref) {
  return MediaGridTopPositionController();
});

final recommendedMangaBottomPositionController =
    StateNotifierProvider<MediaGridBottomPositionController, bool>((ref) {
  return MediaGridBottomPositionController();
});

// For trending manga screen
final trendingMangaController =
    StateNotifierProvider<MediaGridControllerStateNotifier, bool>((ref) {
  return MediaGridControllerStateNotifier();
});

final trendingMangaTopPositionController =
    StateNotifierProvider<MediaGridTopPositionController, bool>((ref) {
  return MediaGridTopPositionController();
});

final trendingMangaBottomPositionController =
    StateNotifierProvider<MediaGridBottomPositionController, bool>((ref) {
  return MediaGridBottomPositionController();
});

// state will be atBottom
class MediaGridBottomPositionController extends StateNotifier<bool> {
  MediaGridBottomPositionController() : super(false);

  void setAtBottom(bool atBottom) {
    Future.delayed(const Duration(seconds: 0), () {
      state = atBottom;
    });
  }
}

// state will be atTop
class MediaGridTopPositionController extends StateNotifier<bool> {
  MediaGridTopPositionController() : super(true);

  void setAtTop(bool atTop) {
    Future.delayed(const Duration(seconds: 0), () {
      state = atTop;
    });
  }
}

// Here state will be isLoading
class MediaGridControllerStateNotifier extends StateNotifier<bool> {
  MediaGridControllerStateNotifier() : super(false);

  int pageCount = 1;
  int lastVisitedPage = 1;
  List<Fragment$MediaShort?> mediaList = [];
  bool hasNextPage = false;
  bool isControllerAtBottom = false;
  bool isControllerAtTop = true;

  void resetController() {
    pageCount = 1;
    lastVisitedPage = 1;
    mediaList = [];
    hasNextPage = false;
    isControllerAtBottom = false;
    isControllerAtTop = false;
    Future.delayed(const Duration(seconds: 0), () {
      state = true;
      dev.log('Controller reset', name: 'Data');
    });
  }

  void setHasNextPage(bool hasNextPage) {
    this.hasNextPage = hasNextPage;
    dev.log('Has next page set to: ${this.hasNextPage}', name: 'Data');
  }

  void setLastVisitedPage(int lastVisitedPage) {
    this.lastVisitedPage = lastVisitedPage;
    dev.log('Last visited page: ${this.lastVisitedPage}', name: 'Data');
  }

  void incrementPageCount() {
    pageCount++;
    dev.log('Page count after increment: $pageCount', name: 'Data');
    state = true;
  }

  void decreasePageCount() {
    if (pageCount > lastVisitedPage) {
      pageCount--;
    }
    dev.log('Page count after decrement: $pageCount', name: 'Data');
    Future.delayed(
      const Duration(seconds: 0),
      () {
        state = false;
      },
    );
  }

  void setIsLoading(bool isLoading) {
    Future.delayed(const Duration(seconds: 0), () {
      state = isLoading;
      dev.log('Set loading = $state', name: 'Data');
    });
  }

  void addToMediaList(List<Fragment$MediaShort?> newMediaList) {
    mediaList.addAll(newMediaList);
    dev.log('Media list size: ${mediaList.length}', name: 'Data');
    Future.delayed(
      const Duration(seconds: 0),
      () {
        state = false;
        dev.log('Changed loading = $state after adding data', name: 'Data');
      },
    );
    // Future.delayed(const Duration(seconds: 5), () {
    //   notifyListeners();
    // },);
  }

  @override
  bool updateShouldNotify(bool old, bool current) {
    return super.updateShouldNotify(old, current);
  }
}
