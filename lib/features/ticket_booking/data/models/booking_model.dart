import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String id,
    required int movieId,
    required String movieTitle,
    String? moviePosterPath,
    required String cinemaName,
    required String date, // yyyy-MM-dd
    required String timeSlot,
    required List<String> seats,
    @Default(BookingStatus.confirmed) BookingStatus status,
    @Default(0.0) double totalPrice,
    @JsonKey(fromJson: _tsFromJson, toJson: _tsToJson)
    required DateTime bookedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  factory Booking.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Booking.fromJson({...data, 'id': doc.id});
  }
}

enum BookingStatus { confirmed, cancelled, expired }

extension BookingX on Booking {
  String get posterUrl => moviePosterPath != null
      ? 'https://image.tmdb.org/t/p/w500$moviePosterPath'
      : '';

  String get seatsSummary => seats.join(', ');

  bool get isCancellable => status == BookingStatus.confirmed;
}

DateTime _tsFromJson(dynamic v) =>
    v is Timestamp ? v.toDate() : DateTime.parse(v as String);
String _tsToJson(DateTime dt) => dt.toIso8601String();

// Seat model
@freezed
abstract class SeatModel with _$SeatModel {
  const factory SeatModel({
    required String id, // e.g. "A1"
    required bool isAvailable,
    required SeatType type,
  }) = _SeatModel;
}

enum SeatType { standard, premium, vip }

extension SeatTypeX on SeatType {
  String get label => switch (this) {
        SeatType.standard => 'Standard',
        SeatType.premium => 'Premium',
        SeatType.vip => 'VIP',
      };

  double get price => switch (this) {
        SeatType.standard => 12.0,
        SeatType.premium => 18.0,
        SeatType.vip => 25.0,
      };
}

const kCinemas = [
  'CineVerse IMAX - Downtown',
  'CineVerse Multiplex - Westside',
  'CineVerse Gold Class - Eastgate',
  'AMC Premiere - Central',
];

const kTimeSlots = [
  '10:00 AM',
  '12:30 PM',
  '03:00 PM',
  '05:30 PM',
  '08:00 PM',
  '10:30 PM',
];
