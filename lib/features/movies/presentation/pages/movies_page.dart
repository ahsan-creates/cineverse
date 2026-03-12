import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:cineverse/features/movies/data/repositories/movie_repository.dart';
import 'package:cineverse/features/movies/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class MoviesPage extends ConsumerWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                child: Text(
                  'Movies',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Trending',
                ref.watch(trendingMoviesProvider),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Now Playing',
                ref.watch(nowPlayingMoviesProvider),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Popular',
                ref.watch(popularMoviesProvider),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Upcoming',
                ref.watch(upcomingMoviesProvider),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    WidgetRef ref,
    BuildContext context,
    String title,
    AsyncValue<List<MovieModel>> moviesAsync,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        SizedBox(
          height: 280,
          child: moviesAsync.when(
            data: (movies) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: MovieCard(
                    movie: movie,
                    onTap: () => context.goNamed(
                      'movieDetail',
                      pathParameters: {'id': movie.id.toString()},
                    ),
                  ),
                );
              },
            ),
            loading: () => _buildShimmerList(context),
            error: (e, _) => Center(
              child: Text(
                'Error: $e',
                style: const TextStyle(color: Colors.redAccent),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 5,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Shimmer.fromColors(
          baseColor: AppColors.surface(context),
          highlightColor: AppColors.surface2(context),
          child: Container(
            width: 140,
            height: 240,
            decoration: BoxDecoration(
              color: AppColors.surface(context),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
