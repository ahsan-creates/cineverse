import 'package:freezed_annotation/freezed_annotation.dart';

part 'watch_provider_model.freezed.dart';
part 'watch_provider_model.g.dart';

@freezed
abstract class WatchProviderItem with _$WatchProviderItem {
  const factory WatchProviderItem({
    @JsonKey(name: 'provider_id') required int providerId,
    @JsonKey(name: 'provider_name') required String providerName,
    @JsonKey(name: 'logo_path') required String logoPath,
    @Default(0) int displayPriority,
  }) = _WatchProviderItem;

  factory WatchProviderItem.fromJson(Map<String, dynamic> json) =>
      _$WatchProviderItemFromJson(json);
}

extension WatchProviderItemX on WatchProviderItem {
  String get logoUrl => 'https://image.tmdb.org/t/p/original$logoPath';
}

@freezed
abstract class WatchProviders with _$WatchProviders {
  const factory WatchProviders({
    @Default([]) List<WatchProviderItem> flatrate, // Streaming
    @Default([]) List<WatchProviderItem> buy, // Buy
    @Default([]) List<WatchProviderItem> rent, // Rent
    @Default([]) List<WatchProviderItem> free, // Free
    String? link, // JustWatch link
  }) = _WatchProviders;

  factory WatchProviders.empty() => const WatchProviders();

  factory WatchProviders.fromRegionJson(Map<String, dynamic>? regionData) {
    if (regionData == null) return WatchProviders.empty();
    List<WatchProviderItem> parse(String key) {
      final list = regionData[key] as List?;
      if (list == null) return [];
      return list
          .map((e) => WatchProviderItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    return WatchProviders(
      flatrate: parse('flatrate'),
      buy: parse('buy'),
      rent: parse('rent'),
      free: parse('free'),
      link: regionData['link'] as String?,
    );
  }
}
