import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/favorites/data/models/favorite_item_model.dart';
import 'package:cineverse/features/favorites/data/repositories/favorites_repository.dart';
import 'package:cineverse/features/favorites/presentation/controllers/favorites_controller.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:cineverse/shared/widgets/error_widget.dart';
import 'package:cineverse/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  final bool showWatchlist;
  const FavoritesPage({super.key, this.showWatchlist = false});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.showWatchlist ? 1 : 0,
    );
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: CvAppBar(
        title: 'My Library',
        showThemeToggle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.icon(context)),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          _buildTabBar(cs),
          Expanded(
            child: TabBarView(
              controller: _tab,
              children: [
                _ItemList(
                  stream: ref.watch(favoritesStreamProvider),
                  emptyLabel: 'No favourites yet',
                  emptyIcon: Icons.favorite_border,
                  onRemove: (item) => ref
                      .read(favoritesControllerProvider.notifier)
                      .toggleFavorite(item),
                ),
                _ItemList(
                  stream: ref.watch(watchlistStreamProvider),
                  emptyLabel: 'Watchlist is empty',
                  emptyIcon: Icons.bookmark_border,
                  onRemove: (item) => ref
                      .read(favoritesControllerProvider.notifier)
                      .toggleWatchlist(item),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(ColorScheme cs) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border(context)),
      ),
      child: TabBar(
        controller: _tab,
        indicator: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: AppColors.textSecondary(context),
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        tabs: const [
          Tab(text: '❤️  Favourites'),
          Tab(text: '🔖  Watchlist'),
        ],
      ),
    );
  }
}

class _ItemList extends StatelessWidget {
  final AsyncValue<List<FavoriteItem>> stream;
  final String emptyLabel;
  final IconData emptyIcon;
  final void Function(FavoriteItem) onRemove;

  const _ItemList({
    required this.stream,
    required this.emptyLabel,
    required this.emptyIcon,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return stream.when(
      loading: () => const CineVerseLoader(),
      error: (e, _) => CineVerseError(message: e.toString()),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  emptyIcon,
                  size: 60,
                  color: AppColors.textDisabled(context),
                ),
                const SizedBox(height: 16),
                Text(emptyLabel, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          itemBuilder: (_, i) => _FavoriteCard(
            item: items[i],
            onRemove: () => onRemove(items[i]),
          ),
        );
      },
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final FavoriteItem item;
  final VoidCallback onRemove;

  const _FavoriteCard({required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete_outline, color: AppColors.error),
      ),
      onDismissed: (_) => onRemove(),
      child: GestureDetector(
        onTap: () {
          final route = item.isMovie ? 'movieDetail' : 'tvShowDetail';
          context.goNamed(
            route,
            pathParameters: {'id': item.mediaId.toString()},
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.surface(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border(context)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: item.posterUrl,
                  width: 52,
                  height: 78,
                  fit: BoxFit.cover,
                  errorWidget: (_, __, ___) => Container(
                    width: 52,
                    height: 78,
                    color: AppColors.surface2(context),
                    child: Icon(
                      Icons.movie,
                      color: AppColors.textDisabled(context),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface2(context),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            item.isMovie ? 'Movie' : 'TV Show',
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (item.rating > 0) ...[
                          const Icon(
                            Icons.star,
                            color: AppColors.amber400,
                            size: 13,
                          ),
                          const SizedBox(width: 3),
                          Text(
                            item.rating.toStringAsFixed(1),
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: AppColors.textDisabled(context),
                  size: 20,
                ),
                onPressed: onRemove,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
