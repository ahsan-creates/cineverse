import 'package:cineverse/features/favorites/data/models/favorite_item_model.dart';
import 'package:cineverse/features/favorites/data/repositories/favorites_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_controller.g.dart';

@riverpod
class FavoritesController extends _$FavoritesController {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  FavoritesRepository get _repo =>
      ref.read(favoritesRepositoryProvider.notifier);

  Future<void> toggleFavorite(FavoriteItem item) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => _repo.toggleFavorite(item));
    if (ref.mounted) state = result;
  }

  Future<void> toggleWatchlist(FavoriteItem item) async {
    state = const AsyncLoading();
    final result = await AsyncValue.guard(() => _repo.toggleWatchlist(item));
    if (ref.mounted) state = result;
  }
}

// ── Per-item state providers ──────────────────────────────────────
@riverpod
Future<bool> isFavorite(Ref ref, int mediaId, MediaType type) async {
  final favorites = await ref.watch(favoritesStreamProvider.future);
  return favorites.any(
    (item) => item.mediaId == mediaId && item.mediaType == type,
  );
}

@riverpod
Future<bool> isInWatchlist(Ref ref, int mediaId, MediaType type) async {
  final watchlist = await ref.watch(watchlistStreamProvider.future);
  return watchlist.any(
    (item) => item.mediaId == mediaId && item.mediaType == type,
  );
}
