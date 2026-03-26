// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AuthRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $NotifierProvider<AuthRepository, UserModel?> {
  AuthRepositoryProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authRepositoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  AuthRepository create() => AuthRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserModel?>(value),
    );
  }
}

String _$authRepositoryHash() => r'b446e87affc62d37d4180cf7419b87f4c382ff06';

abstract class _$AuthRepository extends $Notifier<UserModel?> {
  UserModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserModel?, UserModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UserModel?, UserModel?>, UserModel?, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
