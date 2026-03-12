import 'package:cineverse/features/ticket_booking/data/models/booking_model.dart';
import 'package:cineverse/features/ticket_booking/data/repositories/booking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'booking_controller.freezed.dart';
part 'booking_controller.g.dart';

@freezed
abstract class BookingState with _$BookingState {
  const factory BookingState({
    @Default('') String selectedDate,
    @Default('') String selectedTimeSlot,
    @Default('') String selectedCinema,
    @Default([]) List<String> selectedSeats,
    @Default(false) bool isLoading,
    String? errorMessage,
    Booking? confirmedBooking,
  }) = _BookingState;
}

extension BookingStateX on BookingState {
  bool get canProceed =>
      selectedDate.isNotEmpty &&
      selectedTimeSlot.isNotEmpty &&
      selectedCinema.isNotEmpty &&
      selectedSeats.isNotEmpty;

  double get totalPrice {
    // Simplified pricing
    return selectedSeats.length * 14.99;
  }
}

@riverpod
class BookingController extends _$BookingController {
  @override
  BookingState build() => const BookingState();

  void selectDate(String date) =>
      state = state.copyWith(selectedDate: date, selectedSeats: []);

  void selectTimeSlot(String slot) =>
      state = state.copyWith(selectedTimeSlot: slot, selectedSeats: []);

  void selectCinema(String cinema) =>
      state = state.copyWith(selectedCinema: cinema, selectedSeats: []);

  void toggleSeat(String seatId) {
    final seats = List<String>.from(state.selectedSeats);
    if (seats.contains(seatId)) {
      seats.remove(seatId);
    } else if (seats.length < 8) {
      seats.add(seatId);
    }
    state = state.copyWith(selectedSeats: seats);
  }

  Future<void> confirmBooking({
    required int movieId,
    required String movieTitle,
    String? posterPath,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final booking =
          await ref.read(bookingRepositoryProvider.notifier).createBooking(
                movieId: movieId,
                movieTitle: movieTitle,
                moviePosterPath: posterPath,
                cinemaName: state.selectedCinema,
                date: state.selectedDate,
                timeSlot: state.selectedTimeSlot,
                seats: state.selectedSeats,
                totalPrice: state.totalPrice,
              );
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        confirmedBooking: booking,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  void reset() => state = const BookingState();
}
