import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageCacheManager {
  static const String key = 'imageCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 3),
      maxNrOfCacheObjects: 150,
    ),
  );
}