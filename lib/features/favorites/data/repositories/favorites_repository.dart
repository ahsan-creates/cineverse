import 'package:cineverse/core/providers/firebase_providers.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_controller.dart';
import 'package:cineverse/features/favorites/data/models/favorite_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repository.g.dart';

@riverpod
class FavoritesRepository extends _$FavoritesRepository {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firebaseFirestoreProvider);
  String get _uid {
    final uid = ref.read(authControllerProvider).user?.uid;
    if (uid == null) throw StateError('User not authenticated');
    return uid;
  }

  CollectionReference<Map<String, dynamic>> _col(String sub) =>
      _db.collection('users').doc(_uid).collection(sub);

  // ── Favorites ──────────────────────────────────────────────────
  Stream<List<FavoriteItem>> watchFavorites() => _col('favorites')
      .orderBy('addedAt', descending: true)
      .snapshots()
      .map((s) => s.docs.map((d) => FavoriteItem.fromFirestore(d)).toList());

  Future<bool> isFavorite(int mediaId, MediaType type) async {
    final id = '${type.name}_$mediaId';
    final doc = await _col('favorites').doc(id).get();
    return doc.exists;
  }

  Future<void> addFavorite(FavoriteItem item) =>
      _col('favorites').doc(item.id).set(item.toJson());

  Future<void> removeFavorite(String id) => _col('favorites').doc(id).delete();

  Future<void> toggleFavorite(FavoriteItem item) async {
    final exists = await isFavorite(item.mediaId, item.mediaType);
    if (exists) {
      await removeFavorite(item.id);
    } else {
      await addFavorite(item);
    }
  }

  // ── Watchlist ──────────────────────────────────────────────────
  Stream<List<FavoriteItem>> watchWatchlist() => _col('watchlist')
      .orderBy('addedAt', descending: true)
      .snapshots()
      .map((s) => s.docs.map((d) => FavoriteItem.fromFirestore(d)).toList());

  Future<bool> isInWatchlist(int mediaId, MediaType type) async {
    final id = '${type.name}_$mediaId';
    final doc = await _col('watchlist').doc(id).get();
    return doc.exists;
  }

  Future<void> addToWatchlist(FavoriteItem item) =>
      _col('watchlist').doc(item.id).set(item.toJson());

  Future<void> removeFromWatchlist(String id) =>
      _col('watchlist').doc(id).delete();

  Future<void> toggleWatchlist(FavoriteItem item) async {
    final exists = await isInWatchlist(item.mediaId, item.mediaType);
    if (exists) {
      await removeFromWatchlist(item.id);
    } else {
      await addToWatchlist(item);
    }
  }
}

// ── Stream providers ──────────────────────────────────────────────
@riverpod
Stream<List<FavoriteItem>> favoritesStream(Ref ref) =>
    ref.watch(favoritesRepositoryProvider.notifier).watchFavorites();

@riverpod
Stream<List<FavoriteItem>> watchlistStream(Ref ref) =>
    ref.watch(favoritesRepositoryProvider.notifier).watchWatchlist();
