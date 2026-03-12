import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/movies/data/models/movie_model.dart';
import 'package:cineverse/features/tv_shows/data/models/tv_show_model.dart';
import 'package:cineverse/features/tv_shows/data/repositories/tv_show_repository.dart';
import 'package:cineverse/features/tv_shows/presentation/widgets/tv_show_card.dart';
import 'package:cineverse/shared/widgets/cv_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class TvShowDetailPage extends ConsumerWidget {
  final int tvShowId;
  const TvShowDetailPage({super.key, required this.tvShowId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showAsync = ref.watch(tvShowDetailProvider(tvShowId));
    final videosAsync = ref.watch(tvShowVideosProvider(tvShowId));
    final similarAsync = ref.watch(similarShowsProvider(tvShowId));

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: showAsync.when(
        data: (show) =>
            _buildContent(context, ref, show, videosAsync, similarAsync),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.amber600),
        ),
        error: (e, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.redAccent,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load: $e',
                style: const TextStyle(color: AppColors.amber300),
              ),
              TextButton(
                onPressed: () => ref.invalidate(tvShowDetailProvider(tvShowId)),
                child: const Text(
                  'Retry',
                  style: TextStyle(color: AppColors.amber600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    TvShowDetailModel show,
    AsyncValue<List<VideoModel>> videosAsync,
    AsyncValue<List<TvShowModel>> similarAsync,
  ) {
    final size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: size.height * 0.42,
          pinned: true,
          backgroundColor: AppColors.scaffold(context),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                if (show.backdropUrl.isNotEmpty)
                  CachedNetworkImage(
                    imageUrl: show.backdropUrl,
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
                      stops: const [0.4, 0.75, 1.0],
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: show.posterUrl,
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
                            show.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                              CvBadge(
                                icon: Icons.star,
                                label: show.formattedRating,
                                color: AppColors.amber600,
                              ),
                              const SizedBox(width: 8),
                              CvBadge(
                                icon: Icons.calendar_today,
                                label: show.year,
                                color: AppColors.surface2(context),
                              ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              CvBadge(
                                icon: Icons.live_tv,
                                label: '${show.numberOfSeasons} Seasons',
                                color: AppColors.surface2(context),
                              ),
                              const SizedBox(width: 8),
                              CvBadge(
                                icon: Icons.movie_filter,
                                label: '${show.numberOfEpisodes} Eps',
                                color: AppColors.surface2(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: show.genres
                                .take(3)
                                .map(
                                  (g) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.orange600
                                            .withValues(alpha: 0.5),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      g.name,
                                      style: const TextStyle(
                                        color: AppColors.amber300,
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
                const SizedBox(height: 24),
                Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  show.overview.isNotEmpty
                      ? show.overview
                      : 'No overview available.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 28),
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
                            itemBuilder: (context, index) {
                              final t = trailers[index];
                              return GestureDetector(
                                onTap: () => launchUrl(Uri.parse(t.youtubeUrl)),
                                child: Container(
                                  width: 160,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(t.thumbnailUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Colors.black.withValues(alpha: 0.4),
                                    ),
                                    child: const Icon(
                                      Icons.play_circle_fill,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 28),
                      ],
                    );
                  },
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                ),
                similarAsync.when(
                  data: (shows) {
                    if (shows.isEmpty) return const SizedBox();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Similar Shows',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: shows.take(10).length,
                            itemBuilder: (context, index) {
                              final s = shows[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: TvShowCard(
                                  tvShow: s,
                                  onTap: () => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          TvShowDetailPage(tvShowId: s.id),
                                    ),
                                  ),
                                ),
                              );
                            },
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



