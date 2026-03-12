import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/tv_shows/data/models/tv_show_model.dart';
import 'package:cineverse/features/tv_shows/data/repositories/tv_show_repository.dart';
import 'package:cineverse/features/tv_shows/presentation/widgets/tv_show_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class TvShowsPage extends ConsumerWidget {
  const TvShowsPage({super.key});

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
                  'TV Shows',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Trending',
                ref.watch(trendingShowsProvider),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'On Air Now',
                ref.watch(onAirShowsProvider),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildSection(
                ref,
                context,
                'Popular',
                ref.watch(popularShowsProvider),
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
    AsyncValue<List<TvShowModel>> showsAsync,
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
          child: showsAsync.when(
            data: (shows) => ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: shows.length,
              itemBuilder: (context, index) {
                final show = shows[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: TvShowCard(
                    tvShow: show,
                    onTap: () => context.goNamed(
                      'tvShowDetail',
                      pathParameters: {'id': show.id.toString()},
                    ),
                  ),
                );
              },
            ),
            loading: () => ListView.builder(
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
            ),
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
}
