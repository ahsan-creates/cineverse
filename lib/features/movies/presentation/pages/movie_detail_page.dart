import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/favorites/data/models/favorite_item_model.dart';
import 'package:cineverse/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:cineverse/features/movies/data/repositories/movie_repository.dart';
import 'package:cineverse/features/movies/presentation/widgets/movie_card.dart';
import 'package:cineverse/features/watch_providers/presentation/widgets/watch_providers_widget.dart';
import 'package:cineverse/shared/widgets/cv_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieAsync = ref.watch(movieDetailProvider(movieId));
    final videosAsync = ref.watch(movieVideosProvider(movieId));
    final similarAsync = ref.watch(similarMoviesProvider(movieId));
    final isFavAsync = ref.watch(isFavoriteProvider(movieId, MediaType.movie));
    final isWlAsync =
        ref.watch(isInWatchlistProvider(movieId, MediaType.movie));

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: movieAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.amber600),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: AppColors.error, size: 48),
              const SizedBox(height: 16),
              Text('$e', style: Theme.of(context).textTheme.bodyMedium),
              TextButton(
                onPressed: () => ref.invalidate(movieDetailProvider(movieId)),
                child: const Text(
                  'Retry',
                  style: TextStyle(color: AppColors.amber600),
                ),
              ),
            ],
          ),
        ),
        data: (movie) => _Content(
          movie: movie,
          videosAsync: videosAsync,
          similarAsync: similarAsync,
          isFavAsync: isFavAsync,
          isWlAsync: isWlAsync,
          ref: ref,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final MovieDetailModel movie;
  final AsyncValue<List<VideoModel>> videosAsync;
  final AsyncValue<List<MovieModel>> similarAsync;
  final AsyncValue<bool> isFavAsync;
  final AsyncValue<bool> isWlAsync;
  final WidgetRef ref;

  const _Content({
    required this.movie,
    required this.videosAsync,
    required this.similarAsync,
    required this.isFavAsync,
    required this.isWlAsync,
    required this.ref,
  });

  FavoriteItem _toItem() => FavoriteItem(
        id: 'movie_${movie.id}',
        mediaId: movie.id,
        mediaType: MediaType.movie,
        title: movie.title,
        posterPath: movie.posterPath,
        rating: movie.voteAverage,
        addedAt: DateTime.now(),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        // ── Backdrop App Bar ──────────────────────────────────────────
        SliverAppBar(
          expandedHeight: size.height * 0.44,
          pinned: true,
          backgroundColor: AppColors.scaffold(context),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.amber600),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            // Favourite button
            isFavAsync.when(
              data: (isFav) => IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : AppColors.amber600,
                ),
                onPressed: () => ref
                    .read(favoritesControllerProvider.notifier)
                    .toggleFavorite(_toItem()),
              ),
              loading: () => const SizedBox(width: 48),
              error: (_, __) => const SizedBox(width: 48),
            ),
            // Watchlist button
            isWlAsync.when(
              data: (inWl) => IconButton(
                icon: Icon(
                  inWl ? Icons.bookmark : Icons.bookmark_border,
                  color: inWl ? AppColors.amber400 : AppColors.amber600,
                ),
                onPressed: () => ref
                    .read(favoritesControllerProvider.notifier)
                    .toggleWatchlist(_toItem()),
              ),
              loading: () => const SizedBox(width: 48),
              error: (_, __) => const SizedBox(width: 48),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (movie.backdropUrl.isNotEmpty)
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
                        AppColors.scaffold(context).withValues(alpha: 0.7),
                        AppColors.scaffold(context),
                      ],
                      stops: const [0.35, 0.72, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Poster + Meta ───────────────────────────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: movie.posterUrl,
                        width: 110,
                        height: 165,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            movie.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          if ((movie.tagline ?? '').isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              '"${movie.tagline!}"',
                              style: TextStyle(
                                color: AppColors.textSecondary(context),
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                            ),
                          ],
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              CvBadge(
                                icon: Icons.star,
                                label: movie.formattedRating,
                                color: AppColors.amber600,
                              ),
                              CvBadge(
                                icon: Icons.calendar_today,
                                label: movie.year,
                                color: AppColors.amber400,
                              ),
                              CvBadge(
                                icon: Icons.timer,
                                label: movie.formattedRuntime,
                                color: AppColors.amber300,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: movie.genres
                                .take(3)
                                .map(
                                  (g) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.amber600
                                            .withValues(alpha: 0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      g.name,
                                      style: TextStyle(
                                        color: AppColors.textSecondary(context),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // ── Book Tickets CTA ─────────────────────────────────────────
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () => context.goNamed(
                        'bookMovie',
                        pathParameters: {
                          'id': movie.id.toString(),
                        },
                        extra: {
                          'title': movie.title,
                          'posterPath': movie.posterPath,
                        },
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(
                        Icons.confirmation_number_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: const Text(
                        'Book Tickets',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Overview ───────────────────────────────────────────────
                const SizedBox(height: 24),
                Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  movie.overview.isNotEmpty
                      ? movie.overview
                      : 'No overview available.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                // ── Watch Providers ────────────────────────────────────────
                const SizedBox(height: 24),
                WatchProvidersWidget(mediaId: movie.id, isMovie: true),

                // ── Trailers ──────────────────────────────────────────────
                videosAsync.when(
                  data: (videos) {
                    final trailers = videos
                        .where((v) => v.isTrailer && v.isYoutube)
                        .toList();
                    if (trailers.isEmpty) return const SizedBox();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Trailers',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: trailers.length,
                            itemBuilder: (_, i) =>
                                _TrailerThumb(trailer: trailers[i]),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),

                // ── Similar ────────────────────────────────────────────────
                similarAsync.when(
                  data: (movies) {
                    if (movies.isEmpty) return const SizedBox();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Similar Movies',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movies.take(10).length,
                            itemBuilder: (context, i) => Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: MovieCard(
                                movie: movies[i],
                                onTap: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        MovieDetailPage(movieId: movies[i].id),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TrailerThumb extends StatelessWidget {
  final VideoModel trailer;
  const _TrailerThumb({required this.trailer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(trailer.youtubeUrl)),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(trailer.thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withValues(alpha: 0.38),
          ),
          child:
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 40),
        ),
      ),
    );
  }
}
