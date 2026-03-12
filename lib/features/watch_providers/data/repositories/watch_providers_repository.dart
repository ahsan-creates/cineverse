import 'package:cineverse/core/providers/tmdb_providers.dart';
import 'package:cineverse/features/watch_providers/data/models/watch_provider_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'watch_providers_repository.g.dart';

@riverpod
class WatchProvidersRepository extends _$WatchProvidersRepository {
  late final Dio dio;

  @override
  void build() {
    dio = ref.read(tmdbDioProvider);
  }

  Future<WatchProviders> getMovieProviders(
    int movieId, {
    String region = 'US',
  }) async {
    try {
      final res = await dio.get(
        '/movie/$movieId/watch/providers',
      );
      final results = res.data['results'] as Map<String, dynamic>?;
      final regionData = results?[region] as Map<String, dynamic>?;
      return WatchProviders.fromRegionJson(regionData);
    } catch (_) {
      return WatchProviders.empty();
    }
  }

  Future<WatchProviders> getTvShowProviders(
    int tvId, {
    String region = 'US',
  }) async {
    try {
      final res = await dio.get(
        '/tv/$tvId/watch/providers',
      );
      final results = res.data['results'] as Map<String, dynamic>?;
      final regionData = results?[region] as Map<String, dynamic>?;
      return WatchProviders.fromRegionJson(regionData);
    } catch (_) {
      return WatchProviders.empty();
    }
  }
}

@riverpod
Future<WatchProviders> movieWatchProviders(Ref ref, int movieId) => ref
    .read(watchProvidersRepositoryProvider.notifier)
    .getMovieProviders(movieId);

@riverpod
Future<WatchProviders> tvShowWatchProviders(Ref ref, int tvId) => ref
    .read(watchProvidersRepositoryProvider.notifier)
    .getTvShowProviders(tvId);
