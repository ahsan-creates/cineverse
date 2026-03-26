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
                  onToggle: (seatId) {
                    if (!state.selectedSeats.contains(seatId) &&
                        state.selectedSeats.length >= 8) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Maximum 8 seats per booking'),
                          backgroundColor: AppColors.amber600,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                      return;
                    }
                    notifier.toggleSeat(seatId);
                  },
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
              onConfirm: () => _showPaymentDialog(
                context: context,
                ref: ref,
                state: state,
                notifier: notifier,
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

// ── Payment dialog ────────────────────────────────────────────────

void _showPaymentDialog({
  required BuildContext context,
  required WidgetRef ref,
  required BookingState state,
  required BookingController notifier,
  required int movieId,
  required String movieTitle,
  String? posterPath,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (_) => _PaymentDialog(
      state: state,
      movieTitle: movieTitle,
      posterPath: posterPath,
      onPay: () {
        Navigator.of(context, rootNavigator: true).pop();
        notifier.confirmBooking(
          movieId: movieId,
          movieTitle: movieTitle,
          posterPath: posterPath,
        );
      },
    ),
  );
}

class _PaymentDialog extends StatefulWidget {
  final BookingState state;
  final String movieTitle;
  final String? posterPath;
  final VoidCallback onPay;

  const _PaymentDialog({
    required this.state,
    required this.movieTitle,
    this.posterPath,
    required this.onPay,
  });

  @override
  State<_PaymentDialog> createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<_PaymentDialog> {
  int _selectedCard = 0;

  static const _cards = [
    {'label': 'Visa •••• 4242', 'icon': Icons.credit_card},
    {'label': 'Mastercard •••• 8810', 'icon': Icons.credit_card_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    final s = widget.state;
    final screenH = MediaQuery.sizeOf(context).height;
    final isSmall = screenH < 700;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: AppColors.surface(context),
          constraints: BoxConstraints(
            maxWidth: 480,
            maxHeight: screenH * 0.88,
          ),
          child: Column(
            // Do NOT use mainAxisSize.min here — the Container above has a
            // maxHeight constraint, so the Column must be MainAxisSize.max
            // (the default) so that Expanded children receive real height.
            // mainAxisSize.min + Expanded/Flexible = zero-height body (Flutter trap).
            children: [
              // ── Header ────────────────────────────────────────
              Container(
                padding: EdgeInsets.fromLTRB(
                  20,
                  isSmall ? 16 : 20,
                  8,
                  isSmall ? 12 : 16,
                ),
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Order Summary',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white70,
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 36, minHeight: 36),
                    ),
                  ],
                ),
              ),

              // ── Scrollable body ───────────────────────────────
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isSmall ? 16 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Movie row
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: widget.posterPath != null
                                ? CachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w92${widget.posterPath}',
                                    width: 44,
                                    height: 66,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    width: 44,
                                    height: 66,
                                    decoration: BoxDecoration(
                                      color: AppColors.surface2(context),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.movie,
                                      color: AppColors.amber600,
                                      size: 20,
                                    ),
                                  ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.movieTitle,
                                  style: TextStyle(
                                    color: AppColors.textPrimary(context),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  s.selectedCinema,
                                  style: TextStyle(
                                    color: AppColors.textSecondary(context),
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isSmall ? 14 : 20),
                      _divider(context),
                      SizedBox(height: isSmall ? 12 : 16),

                      // Booking details grid
                      _detailRow(
                        context,
                        Icons.calendar_today_outlined,
                        'Date',
                        s.selectedDate,
                      ),
                      const SizedBox(height: 10),
                      _detailRow(
                        context,
                        Icons.access_time_outlined,
                        'Showtime',
                        s.selectedTimeSlot,
                      ),
                      const SizedBox(height: 10),
                      _detailRow(
                        context,
                        Icons.event_seat_outlined,
                        'Seats',
                        s.selectedSeats.join(', '),
                      ),

                      SizedBox(height: isSmall ? 12 : 16),
                      _divider(context),
                      SizedBox(height: isSmall ? 12 : 16),

                      // Price breakdown
                      _sectionHeading('Price Breakdown', context),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${s.selectedSeats.length} × \$14.99',
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '\$${s.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: AppColors.textPrimary(context),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking fee',
                            style: TextStyle(
                              color: AppColors.textSecondary(context),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            '\$0.00',
                            style: TextStyle(
                              color: AppColors.textPrimary(context),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.amber600.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.amber600.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: TextStyle(
                                color: AppColors.amber600,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '\$${s.totalPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: AppColors.amber600,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isSmall ? 12 : 16),
                      _divider(context),
                      SizedBox(height: isSmall ? 10 : 14),

                      // Payment method
                      _sectionHeading('Payment Method', context),
                      const SizedBox(height: 10),
                      ...List.generate(_cards.length, (i) {
                        final card = _cards[i];
                        final sel = _selectedCard == i;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCard = i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: sel
                                  ? AppColors.amber600.withValues(alpha: 0.10)
                                  : AppColors.surface2(context),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: sel
                                    ? AppColors.amber600
                                    : AppColors.border(context),
                                width: sel ? 1.5 : 0.8,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  card['icon'] as IconData,
                                  color: sel
                                      ? AppColors.amber600
                                      : AppColors.textDisabled(context),
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    card['label'] as String,
                                    style: TextStyle(
                                      color: sel
                                          ? AppColors.amber600
                                          : AppColors.textPrimary(context),
                                      fontWeight: sel
                                          ? FontWeight.w700
                                          : FontWeight.w400,
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
                      }),
                    ],
                  ),
                ),
              ),

              // ── Sticky Pay button ─────────────────────────────
              Container(
                padding: EdgeInsets.fromLTRB(
                  20,
                  12,
                  20,
                  12 + MediaQuery.paddingOf(context).bottom,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface(context),
                  border: Border(
                    top: BorderSide(color: AppColors.border(context)),
                  ),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton.icon(
                      onPressed: widget.onPay,
                      icon: const Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: Text(
                        'Pay \$${widget.state.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) => Divider(
        color: AppColors.border(context),
        height: 1,
      );

  Widget _sectionHeading(String text, BuildContext context) => Text(
        text.toUpperCase(),
        style: TextStyle(
          color: AppColors.textSecondary(context),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      );

  Widget _detailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.amber600, size: 16),
        const SizedBox(width: 8),
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.textDisabled(context),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary(context),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
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
