import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/ticket_booking/data/models/booking_model.dart';
import 'package:cineverse/features/ticket_booking/presentation/controllers/booking_controller.dart';
import 'package:cineverse/shared/widgets/cv_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingPage extends ConsumerWidget {
  final int movieId;
  final String movieTitle;
  final String? posterPath;

  const BookingPage({
    super.key,
    required this.movieId,
    required this.movieTitle,
    this.posterPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingControllerProvider);
    final notifier = ref.read(bookingControllerProvider.notifier);

    // Navigate to confirmation when booking confirmed
    ref.listen(bookingControllerProvider, (_, next) {
      if (next.confirmedBooking != null) {
        context.goNamed(
          'bookingConfirmation',
          extra: next.confirmedBooking!,
        );
        notifier.reset();
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      appBar: const CvAppBar(title: 'Book Tickets'),
      body: CustomScrollView(
        slivers: [
          // Movie header
          SliverToBoxAdapter(
            child: _MovieHeader(
              title: movieTitle,
              posterPath: posterPath,
            ),
          ),

          // Cinema selection
          SliverToBoxAdapter(
            child: _Section(
              title: 'Select Cinema',
              child: _CinemaSelector(
                selected: state.selectedCinema,
                onSelect: notifier.selectCinema,
              ),
            ),
          ),

          // Date selection
          SliverToBoxAdapter(
            child: _Section(
              title: 'Select Date',
              child: _DateSelector(
                selected: state.selectedDate,
                onSelect: notifier.selectDate,
              ),
            ),
          ),

          // Time slot
          SliverToBoxAdapter(
            child: _Section(
              title: 'Select Showtime',
              child: _TimeSlotSelector(
                selected: state.selectedTimeSlot,
                onSelect: notifier.selectTimeSlot,
              ),
            ),
          ),

          // Seat selection
          if (state.selectedCinema.isNotEmpty &&
              state.selectedDate.isNotEmpty &&
              state.selectedTimeSlot.isNotEmpty)
            SliverToBoxAdapter(
              child: _Section(
                title: 'Select Seats  '
                    '(${state.selectedSeats.length} selected)',
                child: _SeatGrid(
                  selectedSeats: state.selectedSeats,
                  onToggle: notifier.toggleSeat,
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 120)),
        ],
      ),

      // Bottom CTA
      bottomNavigationBar: state.canProceed
          ? _BottomCta(
              seatCount: state.selectedSeats.length,
              total: state.totalPrice,
              isLoading: state.isLoading,
              onConfirm: () => notifier.confirmBooking(
                movieId: movieId,
                movieTitle: movieTitle,
                posterPath: posterPath,
              ),
            )
          : null,
    );
  }
}

class _MovieHeader extends StatelessWidget {
  final String title;
  final String? posterPath;

  const _MovieHeader({required this.title, this.posterPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: posterPath != null
                ? CachedNetworkImage(
                    imageUrl: 'https://image.tmdb.org/t/p/w200$posterPath',
                    width: 60,
                    height: 90,
                    fit: BoxFit.cover,
                  )
                : Container(
                    width: 60,
                    height: 90,
                    color: AppColors.surface2(context),
                    child: const Icon(Icons.movie, color: AppColors.amber600),
                  ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Now Booking',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: AppColors.textSecondary(context),
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _CinemaSelector extends StatelessWidget {
  final String selected;
  final void Function(String) onSelect;

  const _CinemaSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: kCinemas.map((c) {
        final sel = selected == c;
        return GestureDetector(
          onTap: () => onSelect(c),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: sel
                  ? AppColors.amber600.withValues(alpha: 0.15)
                  : AppColors.surface(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: sel ? AppColors.amber600 : AppColors.border(context),
                width: sel ? 1.5 : 0.8,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.theaters_outlined,
                  color: sel
                      ? AppColors.amber600
                      : AppColors.textDisabled(context),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    c,
                    style: TextStyle(
                      color: sel
                          ? AppColors.amber600
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: sel ? FontWeight.w700 : FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (sel)
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.amber600,
                    size: 18,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _DateSelector extends StatelessWidget {
  final String selected;
  final void Function(String) onSelect;

  const _DateSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dates = List.generate(14, (i) => now.add(Duration(days: i)));
    final fmt = DateFormat('yyyy-MM-dd');
    final labelFmt = DateFormat('EEE\ndd');

    return SizedBox(
      height: 72,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (_, i) {
          final d = dates[i];
          final key = fmt.format(d);
          final sel = selected == key;
          return GestureDetector(
            onTap: () => onSelect(key),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 52,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                gradient: sel ? AppColors.primaryGradient : null,
                color: sel ? null : AppColors.surface(context),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: sel ? Colors.transparent : AppColors.border(context),
                  width: 0.8,
                ),
              ),
              child: Center(
                child: Text(
                  labelFmt.format(d),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: sel
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
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

class _TimeSlotSelector extends StatelessWidget {
  final String selected;
  final void Function(String) onSelect;

  const _TimeSlotSelector({required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: kTimeSlots.map((slot) {
        final sel = selected == slot;
        return GestureDetector(
          onTap: () => onSelect(slot),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              gradient: sel ? AppColors.primaryGradient : null,
              color: sel ? null : AppColors.surface(context),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: sel ? Colors.transparent : AppColors.border(context),
                width: 0.8,
              ),
            ),
            child: Text(
              slot,
              style: TextStyle(
                color: sel
                    ? Colors.white
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SeatGrid extends StatelessWidget {
  final List<String> selectedSeats;
  final void Function(String) onToggle;

  const _SeatGrid({required this.selectedSeats, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
    const cols = 10;

    // Simulate taken seats
    final taken = {'A3', 'A4', 'B7', 'C2', 'D5', 'D6', 'E8', 'F1', 'G9'};

    return Column(
      children: [
        // Screen indicator
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'SCREEN',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 6,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ),

        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _legendItem(
              AppColors.surface(context),
              AppColors.border(context),
              'Available',
            ),
            const SizedBox(width: 16),
            _legendItem(AppColors.amber600, Colors.transparent, 'Selected'),
            const SizedBox(width: 16),
            _legendItem(
              AppColors.icon(context).withValues(alpha: 0.5),
              Colors.transparent,
              'Taken',
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Grid
        ...rows.map((row) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  child: Text(
                    row,
                    style: TextStyle(
                      color: AppColors.textDisabled(context),
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ...List.generate(cols, (ci) {
                  final seatId = '$row${ci + 1}';
                  final isTaken = taken.contains(seatId);
                  final isSel = selectedSeats.contains(seatId);
                  return GestureDetector(
                    onTap: isTaken ? null : () => onToggle(seatId),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: 26,
                      height: 22,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: isTaken
                            ? AppColors.icon(context).withValues(alpha: 0.5)
                            : isSel
                                ? AppColors.amber600
                                : AppColors.surface(context),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isTaken
                              ? Colors.transparent
                              : isSel
                                  ? AppColors.amber600
                                  : AppColors.border(context),
                          width: 0.8,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ],
    );
  }
}

Widget _legendItem(Color fill, Color border, String label) => Builder(
      builder: (ctx) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: fill,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: border, width: 0.8),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: AppColors.textDisabled(ctx),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );

class _BottomCta extends StatelessWidget {
  final int seatCount;
  final double total;
  final bool isLoading;
  final VoidCallback onConfirm;

  const _BottomCta({
    required this.seatCount,
    required this.total,
    required this.isLoading,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        border: Border(top: BorderSide(color: AppColors.border(context))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$seatCount seat${seatCount > 1 ? 's' : ''}',
                  style: TextStyle(
                    color: AppColors.textSecondary(context),
                    fontSize: 13,
                  ),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.amber600,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 180,
              height: 48,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: isLoading ? null : onConfirm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Confirm Booking',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
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
}
