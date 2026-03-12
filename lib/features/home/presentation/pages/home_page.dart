import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/providers/theme_provider.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:cineverse/features/movies/data/repositories/movie_repository.dart';
import 'package:cineverse/features/movies/presentation/widgets/movie_card.dart';
import 'package:cineverse/features/tv_shows/data/repositories/tv_show_repository.dart';
import 'package:cineverse/features/tv_shows/presentation/widgets/tv_show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMoviesAsync = ref.watch(trendingMoviesProvider);
    final trendingShowsAsync = ref.watch(trendingShowsProvider);
    final nowPlayingAsync = ref.watch(nowPlayingMoviesProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.scaffold(context),
            floating: true,
            title: ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.primaryGradient.createShader(bounds),
              child: const Text(
                'CineVerse',
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: AppColors.amber600),
                onPressed: () => context.goNamed('search'),
              ),
              Consumer(
                builder: (_, ref, __) {
                  final isDark = ref.watch(themeProvider) == ThemeMode.dark;
                  return IconButton(
                    icon: Icon(
                      isDark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined,
                      color: AppColors.amber600,
                    ),
                    onPressed: () =>
                        ref.read(themeProvider.notifier).toggleTheme(),
                  );
                },
              ),
              const SizedBox(width: 4),
            ],
          ),
          // Featured Hero
          SliverToBoxAdapter(
            child: trendingMoviesAsync.when(
              data: (movies) => movies.isNotEmpty
                  ? _HeroCard(movie: movies.first)
                  : const SizedBox(),
              loading: () => _buildHeroShimmer(context),
              error: (_, __) => const SizedBox(),
            ),
          ),
          // Trending Movies
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                  child: Text(
                    'Trending Movies',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: trendingMoviesAsync.when(
                    data: (movies) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: movies.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MovieCard(
                          movie: movies[index],
                          onTap: () => context.goNamed(
                            'movieDetail',
                            pathParameters: {'id': movies[index].id.toString()},
                          ),
                        ),
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.amber600,
                      ),
                    ),
                    error: (_, __) => const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          // Now Playing
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                  child: Text(
                    'Now Playing',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: nowPlayingAsync.when(
                    data: (movies) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: movies.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: MovieCard(
                          movie: movies[index],
                          onTap: () => context.goNamed(
                            'movieDetail',
                            pathParameters: {'id': movies[index].id.toString()},
                          ),
                        ),
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.amber600,
                      ),
                    ),
                    error: (_, __) => const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          // Trending TV Shows
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
                  child: Text(
                    'Trending TV Shows',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: trendingShowsAsync.when(
                    data: (shows) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: shows.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: TvShowCard(
                          tvShow: shows[index],
                          onTap: () => context.goNamed(
                            'tvShowDetail',
                            pathParameters: {'id': shows[index].id.toString()},
                          ),
                        ),
                      ),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.amber600,
                      ),
                    ),
                    error: (_, __) => const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildHeroShimmer(BuildContext context) {
    return Container(
      height: 300,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final MovieModel movie;
  const _HeroCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(
        'movieDetail',
        pathParameters: {'id': movie.id.toString()},
      ),
      child: Container(
        height: 300,
        margin: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.amber600.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: movie.backdropUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.scaffold(context).withValues(alpha: 0.95),
                    ],
                    stops: const [0.3, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.amber400,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          movie.formattedRating,
                          style: const TextStyle(
                            color: AppColors.amber300,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          movie.year,
                          style: const TextStyle(
                            color: AppColors.amber300,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Watch Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
