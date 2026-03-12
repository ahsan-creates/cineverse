import 'package:cineverse/features/auth/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    UserModel? user,
    String? errorMessage,
  }) = _AuthState;
}

extension AuthStateX on AuthState {
  bool get isAuthenticated => user != null;
  bool get hasError => errorMessage != null;
}
