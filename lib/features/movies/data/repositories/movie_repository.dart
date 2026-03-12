import 'package:cineverse/core/providers/tmdb_providers.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_repository.g.dart';

@riverpod
class MovieRepository extends _$MovieRepository {
  @override
  void build() {}

  Dio get _dio => ref.read(tmdbDioProvider);

  Future<List<MovieModel>> getTrendingMovies({
    String timeWindow = 'week',
  }) async {
    final res = await _dio.get('/trending/movie/$timeWindow');
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getPopularMovies({int page = 1}) async {
    final res =
        await _dio.get('/movie/popular', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getNowPlayingMovies({int page = 1}) async {
    final res =
        await _dio.get('/movie/now_playing', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getUpcomingMovies({int page = 1}) async {
    final res =
        await _dio.get('/movie/upcoming', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getTopRatedMovies({int page = 1}) async {
    final res =
        await _dio.get('/movie/top_rated', queryParameters: {'page': page});
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final res = await _dio.get('/movie/$movieId');
    return MovieDetailModel.fromJson(res.data);
  }

  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    final res = await _dio.get('/movie/$movieId/videos');
    final results = res.data['results'] as List;
    return results.map((e) => VideoModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> searchMovies(String query, {int page = 1}) async {
    final res = await _dio.get(
      '/search/movie',
      queryParameters: {
        'query': query,
        'page': page,
      },
    );
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  Future<List<MovieModel>> getSimilarMovies(int movieId) async {
    final res = await _dio.get('/movie/$movieId/similar');
    final results = res.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
}

// Convenient providers
@riverpod
Future<List<MovieModel>> trendingMovies(Ref ref) {
  return ref.read(movieRepositoryProvider.notifier).getTrendingMovies();
}

@riverpod
Future<List<MovieModel>> popularMovies(Ref ref) {
  return ref.read(movieRepositoryProvider.notifier).getPopularMovies();
}

@riverpod
Future<List<MovieModel>> nowPlayingMovies(Ref ref) {
  return ref.read(movieRepositoryProvider.notifier).getNowPlayingMovies();
}

@riverpod
Future<List<MovieModel>> upcomingMovies(Ref ref) {
  return ref.read(movieRepositoryProvider.notifier).getUpcomingMovies();
}

@riverpod
Future<MovieDetailModel> movieDetail(Ref ref, int movieId) {
  return ref.read(movieRepositoryProvider.notifier).getMovieDetail(movieId);
}

@riverpod
Future<List<VideoModel>> movieVideos(Ref ref, int movieId) {
  return ref.read(movieRepositoryProvider.notifier).getMovieVideos(movieId);
}

@riverpod
Future<List<MovieModel>> similarMovies(Ref ref, int movieId) {
  return ref.read(movieRepositoryProvider.notifier).getSimilarMovies(movieId);
}
