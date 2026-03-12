// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchProviderItem _$WatchProviderItemFromJson(Map<String, dynamic> json) =>
    _WatchProviderItem(
      providerId: (json['provider_id'] as num).toInt(),
      providerName: json['provider_name'] as String,
      logoPath: json['logo_path'] as String,
      displayPriority: (json['displayPriority'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WatchProviderItemToJson(_WatchProviderItem instance) =>
    <String, dynamic>{
      'provider_id': instance.providerId,
      'provider_name': instance.providerName,
      'logo_path': instance.logoPath,
      'displayPriority': instance.displayPriority,
    };
