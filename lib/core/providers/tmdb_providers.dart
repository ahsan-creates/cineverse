import 'package:cineverse/core/env/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_providers.g.dart';

class TmdbConfig {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static final String apiKey = Env.tmdbApiKey;

  static const String language = 'en-US';

  static String imageUrl(String? path, {String size = 'w500'}) {
    if (path == null || path.isEmpty) return '';
    return 'https://image.tmdb.org/t/p/$size$path';
  }
}

@riverpod
Dio tmdbDio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: TmdbConfig.baseUrl,
      headers: {
        'Authorization': 'Bearer ${TmdbConfig.apiKey}',
        'accept': 'application/json',
      },
      queryParameters: {
        'language': 'en-US',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(LogInterceptor(responseBody: false));
  return dio;
}
