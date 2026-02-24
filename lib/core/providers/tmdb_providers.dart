import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_providers.g.dart';

class TmdbConfig {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String apiKey = 'TMDB_API_KEY';

  static const String language = 'en-US';

  static String imageUrl(String? path, {String size = 'w500'}) {
    if (path == null || path.isEmpty) return '';
    return 'https://image.tmdb.org/t/p/$size$path';
  }
}

@riverpod
Dio tmdbDio(Ref ref) {
  final options = BaseOptions(
    baseUrl: TmdbConfig.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: const {
      'accept': 'application/json',
    },
    queryParameters: const {
      'api_key': TmdbConfig.apiKey,
      'language': TmdbConfig.language,
    },
  );

  return Dio(options);
}
