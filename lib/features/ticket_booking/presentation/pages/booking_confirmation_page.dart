import 'package:cached_network_image/cached_network_image.dart';
import 'package:cineverse/core/theme/app_theme.dart';
import 'package:cineverse/features/ticket_booking/data/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BookingConfirmationPage extends StatelessWidget {
  final Booking booking;

  const BookingConfirmationPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 24),

              // Success icon
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.primaryGradient,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 52,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'Booking Confirmed!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Your tickets are ready',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 36),

              // Ticket card
              _TicketCard(booking: booking),

              const SizedBox(height: 32),

              // Actions
              SizedBox(
                width: double.infinity,
                height: 52,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () => context.goNamed('home'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.goNamed('bookingHistory'),
                child: const Text(
                  'View All Bookings',
                  style: TextStyle(
                    color: AppColors.amber600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketCard extends StatelessWidget {
  final Booking booking;
  const _TicketCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    final dateFormatted = () {
      try {
        final d = DateFormat('yyyy-MM-dd').parse(booking.date);
        return DateFormat('EEE, MMM d yyyy').format(d);
      } catch (_) {
        return booking.date;
      }
    }();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border(context)),
        boxShadow: [
          BoxShadow(
            color: AppColors.amber600.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: booking.posterUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: booking.posterUrl,
                          width: 70,
                          height: 105,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: 70,
                          height: 105,
                          color: AppColors.surface2(context),
                          child: const Icon(
                            Icons.movie,
                            color: AppColors.amber600,
                          ),
                        ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.movieTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      _infoRow(
                        Icons.location_on_outlined,
                        booking.cinemaName,
                        context,
                      ),
                      const SizedBox(height: 6),
                      _infoRow(
                        Icons.calendar_today_outlined,
                        dateFormatted,
                        context,
                      ),
                      const SizedBox(height: 6),
                      _infoRow(
                        Icons.access_time_outlined,
                        booking.timeSlot,
                        context,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Dashed divider
          _dashedDivider(context),

          // Bottom section
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dataBlock('Seats', booking.seatsSummary, context),
                    _dataBlock(
                      'Count',
                      '${booking.seats.length} ticket(s)',
                      context,
                    ),
                    _dataBlock(
                      'Total',
                      '\$${booking.totalPrice.toStringAsFixed(2)}',
                      context,
                      highlight: true,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dataBlock(
                      'Booking ID',
                      booking.id.substring(0, 8).toUpperCase(),
                      context,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.green.withValues(alpha: 0.4),
                        ),
                      ),
                      child: const Text(
                        'Confirmed',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, BuildContext ctx) => Row(
        children: [
          Icon(icon, size: 13, color: AppColors.textSecondary(ctx)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: AppColors.textSecondary(ctx),
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

  Widget _dataBlock(
    String label,
    String value,
    BuildContext ctx, {
    bool highlight = false,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: AppColors.textDisabled(ctx),
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyle(
              color: highlight
                  ? AppColors.amber600
                  : Theme.of(ctx).colorScheme.onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      );

  Widget _dashedDivider(BuildContext ctx) => Row(
        children: List.generate(
          30,
          (i) => Expanded(
            child: Container(
              height: 1,
              color: i.isEven ? AppColors.border(ctx) : Colors.transparent,
            ),
          ),
        ),
      );
}
