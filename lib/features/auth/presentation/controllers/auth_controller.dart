import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/providers/firebase_providers.dart';
import '../../data/repositories/auth_repository.dart';
import 'auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {

  @override
  AuthState build() {
    // Listen to auth state changes
    _listenToAuthChanges();

    // Check initial auth state
    final authRepo = ref.read(authRepositoryProvider.notifier);
    final currentUser = authRepo.currentUser;

    return AuthState(user: currentUser);
  }

  void _listenToAuthChanges() {
    ref.listen(authStateChangesProvider, (previous, next) {
      next.when(
        data: (user) {
          if (user != null) {
            final authRepo = ref.read(authRepositoryProvider.notifier);
            state = state.copyWith(
              user: authRepo.currentUser,
              isLoading: false,
            );
          }
        },
        error: (error, stack) {
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

  // Signup with email and password
  Future<void> signUpWithEmailPassword({
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

      // Send email verification
      await authRepo.sendEmailVerification();

      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  // Sign in with email and password
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

      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  // Sign in with Google
  Future<void> signInWithGoogle() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      final user = await authRepo.signInWithGoogle();

      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final authRepo = ref.read(authRepositoryProvider.notifier);
      await authRepo.signOut();

      state = const AuthState();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      rethrow;
    }
  }

  // Clear error
  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}
