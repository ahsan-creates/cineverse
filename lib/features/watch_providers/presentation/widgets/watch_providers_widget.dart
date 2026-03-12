import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/watch_providers/data/models/watch_provider_model.dart';
import 'package:cineverse/features/watch_providers/data/repositories/watch_providers_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WatchProvidersWidget extends ConsumerWidget {
  final int mediaId;
  final bool isMovie;

  const WatchProvidersWidget({
    super.key,
    required this.mediaId,
    required this.isMovie,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providersAsync = isMovie
        ? ref.watch(movieWatchProvidersProvider(mediaId))
        : ref.watch(tvShowWatchProvidersProvider(mediaId));

    return providersAsync.when(
      loading: () => const SizedBox(
        height: 60,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.amber600,
          ),
        ),
      ),
      error: (_, __) => const SizedBox(),
      data: (providers) {
        final hasAny = providers.flatrate.isNotEmpty ||
            providers.buy.isNotEmpty ||
            providers.rent.isNotEmpty ||
            providers.free.isNotEmpty;

        if (!hasAny) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'No streaming info available (US)',
              style: TextStyle(
                color: AppColors.textDisabled(context),
                fontSize: 13,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where to Watch',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            if (providers.flatrate.isNotEmpty) ...[
              _sectionLabel('Stream', context),
              _ProviderRow(providers.flatrate, providers.link),
              const SizedBox(height: 12),
            ],
            if (providers.free.isNotEmpty) ...[
              _sectionLabel('Free', context),
              _ProviderRow(providers.free, providers.link),
              const SizedBox(height: 12),
            ],
            if (providers.rent.isNotEmpty) ...[
              _sectionLabel('Rent', context),
              _ProviderRow(providers.rent, providers.link),
              const SizedBox(height: 12),
            ],
            if (providers.buy.isNotEmpty) ...[
              _sectionLabel('Buy', context),
              _ProviderRow(providers.buy, providers.link),
              const SizedBox(height: 4),
            ],
            if (providers.link != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(providers.link!)),
                  icon: const Icon(
                    Icons.open_in_new,
                    size: 14,
                    color: AppColors.amber600,
                  ),
                  label: const Text(
                    'More on JustWatch',
                    style: TextStyle(
                      color: AppColors.amber600,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  Widget _sectionLabel(String label, BuildContext ctx) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: AppColors.textSecondary(ctx),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      );
}

class _ProviderRow extends StatelessWidget {
  final List<WatchProviderItem> items;
  final String? link;

  const _ProviderRow(this.items, this.link);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (_, i) {
          final p = items[i];
          return Tooltip(
            message: p.providerName,
            child: GestureDetector(
              onTap: link != null ? () => launchUrl(Uri.parse(link!)) : null,
              child: Container(
                width: 48,
                height: 48,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: AppColors.border(context), width: 0.8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: CachedNetworkImage(
                    imageUrl: p.logoUrl,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => Container(
                      color: AppColors.surface2(context),
                      child: Center(
                        child: Text(
                          p.providerName[0],
                          style: const TextStyle(
                            color: AppColors.amber600,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
