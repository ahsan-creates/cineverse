// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchFilters _$SearchFiltersFromJson(Map<String, dynamic> json) =>
    _SearchFilters(
      query: json['query'] as String? ?? '',
      mediaType: json['mediaType'] as String? ?? 'multi',
      genreId: (json['genreId'] as num?)?.toInt(),
      genreName: json['genreName'] as String?,
      releaseYear: (json['releaseYear'] as num?)?.toInt(),
      minRating: (json['minRating'] as num?)?.toDouble() ?? 0.0,
      maxRating: (json['maxRating'] as num?)?.toDouble() ?? 10.0,
      sortBy: json['sortBy'] as String? ?? 'popularity.desc',
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$SearchFiltersToJson(_SearchFilters instance) =>
    <String, dynamic>{
      'query': instance.query,
      'mediaType': instance.mediaType,
      'genreId': instance.genreId,
      'genreName': instance.genreName,
      'releaseYear': instance.releaseYear,
      'minRating': instance.minRating,
      'maxRating': instance.maxRating,
      'sortBy': instance.sortBy,
      'page': instance.page,
    };
