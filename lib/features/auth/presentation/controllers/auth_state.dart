import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    UserModel? user,
    String? errorMessage,
  }) = _AuthState;

  // Helper getters
  const AuthState._();

  bool get isAuthenticated => user != null;
  bool get hasError => errorMessage != null;
}
