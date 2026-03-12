// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteItem _$FavoriteItemFromJson(Map<String, dynamic> json) =>
    _FavoriteItem(
      id: json['id'] as String,
      mediaId: (json['mediaId'] as num).toInt(),
      mediaType: $enumDecode(_$MediaTypeEnumMap, json['mediaType']),
      title: json['title'] as String,
      posterPath: json['posterPath'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      addedAt: _tsFromJson(json['addedAt']),
    );

Map<String, dynamic> _$FavoriteItemToJson(_FavoriteItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mediaId': instance.mediaId,
      'mediaType': _$MediaTypeEnumMap[instance.mediaType]!,
      'title': instance.title,
      'posterPath': instance.posterPath,
      'rating': instance.rating,
      'addedAt': _tsToJson(instance.addedAt),
    };

const _$MediaTypeEnumMap = {
  MediaType.movie: 'movie',
  MediaType.tvShow: 'tvShow',
};
