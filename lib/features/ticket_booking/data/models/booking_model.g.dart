// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
      id: json['id'] as String,
      movieId: (json['movieId'] as num).toInt(),
      movieTitle: json['movieTitle'] as String,
      moviePosterPath: json['moviePosterPath'] as String?,
      cinemaName: json['cinemaName'] as String,
      date: json['date'] as String,
      timeSlot: json['timeSlot'] as String,
      seats: (json['seats'] as List<dynamic>).map((e) => e as String).toList(),
      status: $enumDecodeNullable(_$BookingStatusEnumMap, json['status']) ??
          BookingStatus.confirmed,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      bookedAt: _tsFromJson(json['bookedAt']),
    );

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
      'id': instance.id,
      'movieId': instance.movieId,
      'movieTitle': instance.movieTitle,
      'moviePosterPath': instance.moviePosterPath,
      'cinemaName': instance.cinemaName,
      'date': instance.date,
      'timeSlot': instance.timeSlot,
      'seats': instance.seats,
      'status': _$BookingStatusEnumMap[instance.status]!,
      'totalPrice': instance.totalPrice,
      'bookedAt': _tsToJson(instance.bookedAt),
    };

const _$BookingStatusEnumMap = {
  BookingStatus.confirmed: 'confirmed',
  BookingStatus.cancelled: 'cancelled',
  BookingStatus.expired: 'expired',
};
