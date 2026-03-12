import 'package:cineverse/core/providers/firebase_providers.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_controller.dart';
import 'package:cineverse/features/ticket_booking/data/models/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'booking_repository.g.dart';

@riverpod
class BookingRepository extends _$BookingRepository {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firebaseFirestoreProvider);
  String get _uid {
    final uid = ref.read(authControllerProvider).user?.uid;
    if (uid == null) throw StateError('User not authenticated');
    return uid;
  }

  CollectionReference<Map<String, dynamic>> get _col =>
      _db.collection('users').doc(_uid).collection('bookings');

  Future<Booking> createBooking({
    required int movieId,
    required String movieTitle,
    String? moviePosterPath,
    required String cinemaName,
    required String date,
    required String timeSlot,
    required List<String> seats,
    required double totalPrice,
  }) async {
    final id = const Uuid().v4();
    final booking = Booking(
      id: id,
      movieId: movieId,
      movieTitle: movieTitle,
      moviePosterPath: moviePosterPath,
      cinemaName: cinemaName,
      date: date,
      timeSlot: timeSlot,
      seats: seats,
      totalPrice: totalPrice,
      bookedAt: DateTime.now(),
    );
    await _col.doc(id).set(booking.toJson());
    return booking;
  }

  Future<void> cancelBooking(String bookingId) =>
      _col.doc(bookingId).update({'status': 'cancelled'});

  Stream<List<Booking>> watchBookings() => _col
      .orderBy('bookedAt', descending: true)
      .snapshots()
      .map((s) => s.docs.map((d) => Booking.fromFirestore(d)).toList());

  Future<List<Booking>> getBookings() async {
    final snap = await _col.orderBy('bookedAt', descending: true).get();
    return snap.docs.map((d) => Booking.fromFirestore(d)).toList();
  }
}

@riverpod
Stream<List<Booking>> bookingsStream(Ref ref) =>
    ref.watch(bookingRepositoryProvider.notifier).watchBookings();
