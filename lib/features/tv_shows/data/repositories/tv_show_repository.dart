import 'package:cineverse/core/providers/tmdb_providers.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:cineverse/features/tv_shows/data/models/tv_show_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tv_show_repository.g.dart';

@riverpod
class TvShowRepository extends _$TvShowRepository {
  @override
  void build() {}

  Dio get _dio => ref.read(tmdbDioProvider);

  Future<List<TvShowModel>> getTrendingShows(
      {String timeWindow = 'week',}) async {
    final res = await _dio.get('/trending/tv/$timeWindow');
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }

  Future<List<TvShowModel>> getPopularShows({int page = 1}) async {
    final res = await _dio.get('/tv/popular', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }

  Future<List<TvShowModel>> getOnAirShows({int page = 1}) async {
    final res =
        await _dio.get('/tv/on_the_air', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }

  Future<List<TvShowModel>> getTopRatedShows({int page = 1}) async {
    final res =
        await _dio.get('/tv/top_rated', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }

  Future<TvShowDetailModel> getTvShowDetail(int tvId) async {
    final res = await _dio.get('/tv/$tvId');
    return TvShowDetailModel.fromJson(res.data);
  }

  Future<List<VideoModel>> getTvShowVideos(int tvId) async {
    final res = await _dio.get('/tv/$tvId/videos');
    final results = res.data['results'] as List;
    return results.map((e) => VideoModel.fromJson(e)).toList();
  }

  Future<List<TvShowModel>> searchShows(String query, {int page = 1}) async {
    final res = await _dio.get('/search/tv', queryParameters: {
      'query': query,
      'page': page,
    },);
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }

  Future<List<TvShowModel>> getSimilarShows(int tvId) async {
    final res = await _dio.get('/tv/$tvId/similar');
    final results = res.data['results'] as List;
    return results.map((e) => TvShowModel.fromJson(e)).toList();
  }
}

@riverpod
Future<List<TvShowModel>> trendingShows(Ref ref) {
  return ref.read(tvShowRepositoryProvider.notifier).getTrendingShows();
}

@riverpod
Future<List<TvShowModel>> popularShows(Ref ref) {
  return ref.read(tvShowRepositoryProvider.notifier).getPopularShows();
}

@riverpod
Future<List<TvShowModel>> onAirShows(Ref ref) {
  return ref.read(tvShowRepositoryProvider.notifier).getOnAirShows();
}

@riverpod
Future<TvShowDetailModel> tvShowDetail(Ref ref, int tvId) {
  return ref.read(tvShowRepositoryProvider.notifier).getTvShowDetail(tvId);
}

@riverpod
Future<List<VideoModel>> tvShowVideos(Ref ref, int tvId) {
  return ref.read(tvShowRepositoryProvider.notifier).getTvShowVideos(tvId);
}

@riverpod
Future<List<TvShowModel>> similarShows(Ref ref, int tvId) {
  return ref.read(tvShowRepositoryProvider.notifier).getSimilarShows(tvId);
}
