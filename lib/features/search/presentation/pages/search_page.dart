import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/search/data/models/search_filters_model.dart';
import 'package:cineverse/features/search/data/repositories/search_repository.dart';
import 'package:cineverse/features/search/presentation/controllers/search_controller.dart';
import 'package:cineverse/shared/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(searchControllerProvider);
    final resultsAsync = ref.watch(searchResultsProvider);
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: SafeArea(
        child: Column(
          children: [
            // ── Search bar ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchCtrl,
                      style: TextStyle(color: cs.onSurface),
                      onChanged: (v) => ref
                          .read(searchControllerProvider.notifier)
                          .updateQuery(v),
                      decoration: InputDecoration(
                        hintText: 'Search movies & TV shows…',
                        prefixIcon:
                            const Icon(Icons.search, color: AppColors.amber600),
                        suffixIcon: _searchCtrl.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: AppColors.textDisabled(context),
                                ),
                                onPressed: () {
                                  _searchCtrl.clear();
                                  ref
                                      .read(searchControllerProvider.notifier)
                                      .updateQuery('');
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: AppColors.surface(context),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: AppColors.border(context)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(color: AppColors.border(context)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              const BorderSide(color: AppColors.amber600),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _FilterButton(
                    hasFilters: filters.hasActiveFilters,
                    onTap: () => _showFilterSheet(context, filters),
                  ),
                ],
              ),
            ),

            // ── Active filter chips ─────────────────────────────────
            if (filters.hasActiveFilters)
              _ActiveFilterChips(
                filters: filters,
                onReset: () =>
                    ref.read(searchControllerProvider.notifier).resetFilters(),
              ),

            // ── Results ─────────────────────────────────────────────
            Expanded(
              child: resultsAsync.when(
                loading: () => const CineVerseLoader(),
                error: (e, _) => Center(
                  child: Text('Error: $e', style: TextStyle(color: cs.error)),
                ),
                data: (items) {
                  if (items.isEmpty) {
                    return _EmptyState(
                      hasQuery:
                          filters.query.isNotEmpty || filters.hasActiveFilters,
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (_, i) => _ResultCard(item: items[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context, SearchFilters current) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _FilterSheet(
        current: current,
        onApply: (f) {
          ref.read(searchControllerProvider.notifier).updateFilters(f);
          Navigator.pop(context);
        },
      ),
    );
  }
}

// ── Filter Button ────────────────────────────────────────────────
class _FilterButton extends StatelessWidget {
  final bool hasFilters;
  final VoidCallback onTap;

  const _FilterButton({required this.hasFilters, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(Icons.tune, color: AppColors.icon(context)),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surface(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: AppColors.border(context)),
            ),
          ),
        ),
        if (hasFilters)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.orange600,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}

// ── Active chips ─────────────────────────────────────────────────
class _ActiveFilterChips extends StatelessWidget {
  final SearchFilters filters;
  final VoidCallback onReset;

  const _ActiveFilterChips({required this.filters, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Row(
        children: [
          if (filters.genreName != null) _Chip(filters.genreName!),
          if (filters.releaseYear != null) _Chip('${filters.releaseYear}'),
          if (filters.minRating > 0 || filters.maxRating < 10)
            _Chip(
              '⭐ ${filters.minRating.toInt()}–${filters.maxRating.toInt()}',
            ),
          if (filters.mediaType != 'multi')
            _Chip(filters.mediaType == 'movie' ? '🎬 Movies' : '📺 TV'),
          GestureDetector(
            onTap: onReset,
            child: Container(
              margin: const EdgeInsets.only(left: 6),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: AppColors.error.withValues(alpha: 0.4)),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.amber600.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.amber600.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.amber600,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Empty state ──────────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final bool hasQuery;
  const _EmptyState({required this.hasQuery});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            hasQuery ? Icons.search_off : Icons.movie_filter_outlined,
            size: 72,
            color: AppColors.textDisabled(context),
          ),
          const SizedBox(height: 16),
          Text(
            hasQuery ? 'No results found' : 'Search or apply filters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            hasQuery
                ? 'Try a different keyword or adjust filters'
                : 'Find movies & TV shows you love',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ── Result card ──────────────────────────────────────────────────
class _ResultCard extends StatelessWidget {
  final SearchResultItem item;
  const _ResultCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final route = item.isMovie ? 'movieDetail' : 'tvShowDetail';
        context.goNamed(route, pathParameters: {'id': item.id.toString()});
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
              child: item.posterUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: item.posterUrl,
                      width: 54,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 54,
                      height: 80,
                      color: AppColors.surface2(context),
                      child: Icon(
                        Icons.movie,
                        color: AppColors.textDisabled(context),
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
                          horizontal: 7,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surface2(context),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item.isMovie ? 'Movie' : 'TV',
                          style: TextStyle(
                            color: AppColors.textSecondary(context),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (item.year.isNotEmpty) ...[
                        const SizedBox(width: 8),
                        Text(
                          item.year,
                          style: TextStyle(
                            color: AppColors.textDisabled(context),
                            fontSize: 12,
                          ),
                        ),
                      ],
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        color: AppColors.amber400,
                        size: 13,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        item.formattedRating,
                        style: TextStyle(
                          color: AppColors.textSecondary(context),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  if (item.overview.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      item.overview,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Filter Bottom Sheet ──────────────────────────────────────────
class _FilterSheet extends StatefulWidget {
  final SearchFilters current;
  final void Function(SearchFilters) onApply;

  const _FilterSheet({required this.current, required this.onApply});

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late SearchFilters _f;

  @override
  void initState() {
    super.initState();
    _f = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final genres = _f.mediaType == 'tv' ? kTvGenres : kMovieGenres;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      builder: (_, ctrl) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ListView(
          controller: ctrl,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.textDisabled(context),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text('Filters', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),

            // Media type
            _label('Content Type', context),
            const SizedBox(height: 8),
            _SegmentRow(
              options: const {
                'multi': 'All',
                'movie': 'Movies',
                'tv': 'TV Shows',
              },
              selected: _f.mediaType,
              onSelect: (v) => setState(() => _f = _f.copyWith(mediaType: v)),
            ),
            const SizedBox(height: 20),

            // Genre
            _label('Genre', context),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: genres.entries.map((e) {
                final sel = _f.genreId == e.key;
                return GestureDetector(
                  onTap: () => setState(
                    () => _f = sel
                        ? _f.copyWith(genreId: null, genreName: null)
                        : _f.copyWith(genreId: e.key, genreName: e.value),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: sel
                          ? AppColors.amber600
                          : AppColors.surface2(context),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: sel
                            ? AppColors.amber600
                            : AppColors.border(context),
                      ),
                    ),
                    child: Text(
                      e.value,
                      style: TextStyle(
                        color: sel
                            ? Colors.white
                            : AppColors.textSecondary(context),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Year
            _label('Release Year', context),
            const SizedBox(height: 8),
            _YearPicker(
              selected: _f.releaseYear,
              onSelect: (y) => setState(() => _f = _f.copyWith(releaseYear: y)),
            ),
            const SizedBox(height: 20),

            // Rating
            _label(
              'Rating: ${_f.minRating.toInt()} – ${_f.maxRating.toInt()}',
              context,
            ),
            RangeSlider(
              values: RangeValues(_f.minRating, _f.maxRating),
              min: 0,
              max: 10,
              divisions: 20,
              activeColor: AppColors.amber600,
              inactiveColor: AppColors.border(context),
              onChanged: (v) => setState(
                () => _f = _f.copyWith(minRating: v.start, maxRating: v.end),
              ),
            ),
            const SizedBox(height: 20),

            // Sort
            _label('Sort By', context),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _f.sortBy,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surface2(context),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.border(context)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.border(context)),
                ),
              ),
              dropdownColor: AppColors.surface(context),
              style: TextStyle(color: cs.onSurface),
              items: kSortOptions.entries
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.key,
                      child: Text(e.value),
                    ),
                  )
                  .toList(),
              onChanged: (v) =>
                  setState(() => _f = _f.copyWith(sortBy: v ?? _f.sortBy)),
            ),
            const SizedBox(height: 32),

            // Apply
            SizedBox(
              width: double.infinity,
              height: 52,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: () => widget.onApply(_f),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String t, BuildContext ctx) => Text(
        t,
        style: TextStyle(
          color: AppColors.textSecondary(ctx),
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
        ),
      );
}

class _SegmentRow extends StatelessWidget {
  final Map<String, String> options;
  final String selected;
  final void Function(String) onSelect;

  const _SegmentRow({
    required this.options,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.entries.map((e) {
        final sel = selected == e.key;
        return Expanded(
          child: GestureDetector(
            onTap: () => onSelect(e.key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 6),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: sel ? AppColors.amber600 : AppColors.surface2(context),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: sel ? AppColors.amber600 : AppColors.border(context),
                ),
              ),
              child: Text(
                e.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: sel ? Colors.white : AppColors.textSecondary(context),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _YearPicker extends StatelessWidget {
  final int? selected;
  final void Function(int?) onSelect;

  const _YearPicker({this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().year;
    final years = List.generate(30, (i) => now - i);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onSelect(null),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: selected == null
                    ? AppColors.amber600
                    : AppColors.surface2(context),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected == null
                      ? AppColors.amber600
                      : AppColors.border(context),
                ),
              ),
              child: Text(
                'Any',
                style: TextStyle(
                  color: selected == null
                      ? Colors.white
                      : AppColors.textSecondary(context),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ...years.map((y) {
            final sel = selected == y;
            return GestureDetector(
              onTap: () => onSelect(y),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(right: 8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: sel ? AppColors.amber600 : AppColors.surface2(context),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: sel ? AppColors.amber600 : AppColors.border(context),
                  ),
                ),
                child: Text(
                  '$y',
                  style: TextStyle(
                    color:
                        sel ? Colors.white : AppColors.textSecondary(context),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
