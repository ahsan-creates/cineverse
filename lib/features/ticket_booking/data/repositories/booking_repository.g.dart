// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BookingRepository)
final bookingRepositoryProvider = BookingRepositoryProvider._();

final class BookingRepositoryProvider
    extends $NotifierProvider<BookingRepository, void> {
  BookingRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookingRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookingRepositoryHash();

  @$internal
  @override
  BookingRepository create() => BookingRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$bookingRepositoryHash() => r'ca32ced60caefbddf4457e83be58a51bfd7513e9';

abstract class _$BookingRepository extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<void, void>, void, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(bookingsStream)
final bookingsStreamProvider = BookingsStreamProvider._();

final class BookingsStreamProvider extends $FunctionalProvider<
        AsyncValue<List<Booking>>, List<Booking>, Stream<List<Booking>>>
    with $FutureModifier<List<Booking>>, $StreamProvider<List<Booking>> {
  BookingsStreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'bookingsStreamProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$bookingsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Booking>> $createElement(
          $ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Booking>> create(Ref ref) {
    return bookingsStream(ref);
  }
}

String _$bookingsStreamHash() => r'ffcaf652db4eba8095724b1a53190d27fcc6e71c';
