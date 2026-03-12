import 'package:cineverse/core/providers/firebase_providers.dart';
import 'package:cineverse/features/auth/data/models/user_model.dart';
import 'package:cineverse/features/auth/data/repositories/auth_repository.dart';
import 'package:cineverse/features/auth/presentation/controllers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    _listenToAuthChanges();
    final authRepo = ref.read(authRepositoryProvider.notifier);
    return AuthState(user: authRepo.currentUser);
  }

  void _listenToAuthChanges() {
    ref.listen(authStateChangesProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            state = state.copyWith(
              user: UserModel.fromFirebaseUser(user),
              isLoading: false,
              errorMessage: null,
            );
          } else {
            state = const AuthState();
          }
        },
        error: (error, _) {
          state = state.copyWith(
            errorMessage: error.toString(),
            isLoading: false,
          );
        },
        loading: () {
          state = state.copyWith(isLoading: true);
        },
      );
    });
  }

  Future<void> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      final user = await authRepo.signUpWithEmailPassword(
        email: email,
        password: password,
        displayName: displayName,
      );
      await authRepo.sendEmailVerification();
      if (!ref.mounted) return;
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      final user = await authRepo.signInWithEmailPassword(
        email: email,
        password: password,
      );
      if (!ref.mounted) return;
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      final user = await authRepo.signInWithGoogle();
      if (!ref.mounted) return;
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      await authRepo.signOut();
      if (!ref.mounted) return;
      state = const AuthState();
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> sendPasswordReset(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      await authRepo.sendPasswordResetEmail(email);
      if (!ref.mounted) return;
      state = state.copyWith(isLoading: false);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
