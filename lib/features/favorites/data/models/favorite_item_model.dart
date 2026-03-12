import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_item_model.freezed.dart';
part 'favorite_item_model.g.dart';

enum MediaType { movie, tvShow }

@freezed
abstract class FavoriteItem with _$FavoriteItem {
  const factory FavoriteItem({
    required String id,
    required int mediaId,
    required MediaType mediaType,
    required String title,
    String? posterPath,
    @Default(0.0) double rating,
    @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
    required DateTime addedAt,
  }) = _FavoriteItem;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) =>
      _$FavoriteItemFromJson(json);

  factory FavoriteItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FavoriteItem.fromJson({...data, 'id': doc.id});
  }
}

DateTime _tsFromJson(dynamic v) =>
    v is Timestamp ? v.toDate() : DateTime.parse(v as String);
String _tsToJson(DateTime dt) => dt.toIso8601String();

extension FavoriteItemX on FavoriteItem {
  String get posterUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';
  bool get isMovie => mediaType == MediaType.movie;
}
