import 'package:cineverse/core/providers/firebase_providers.dart';
import 'package:cineverse/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
class AuthRepository extends _$AuthRepository {
  @override
  UserModel? build() {
    final firebaseUser = ref.watch(firebaseAuthProvider).currentUser;
    return firebaseUser != null
        ? UserModel.fromFirebaseUser(firebaseUser)
        : null;
  }

  UserModel? get currentUser {
    final firebaseUser = ref.read(firebaseAuthProvider).currentUser;
    return firebaseUser != null
        ? UserModel.fromFirebaseUser(firebaseUser)
        : null;
  }

  Future<UserModel> signUpWithEmailPassword({
    required String email,
    required String password,
    String? displayName,
  }) async {
    try {
      final auth = ref.read(firebaseAuthProvider);
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (displayName != null) {
        await credential.user?.updateDisplayName(displayName);
        await credential.user?.reload();
      }
      return UserModel.fromFirebaseUser(auth.currentUser!);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<UserModel> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final auth = ref.read(firebaseAuthProvider);
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(auth.currentUser!);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final googleSignIn = ref.read(googleSignInProvider);
      bool isSupported = googleSignIn.supportsAuthenticate();
      if (!isSupported) {
        throw Exception('Google sign in is not supported on this device');
      }
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final auth = ref.read(firebaseAuthProvider);
      final userCredential = await auth.signInWithCredential(credential);

      //
      if (userCredential.user == null) {
        throw Exception('Google sign in failed');
      }

      return UserModel.fromFirebaseUser(auth.currentUser!);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<void> signOut() async {
    await ref.read(googleSignInProvider).signOut();
    await ref.read(firebaseAuthProvider).signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await ref.read(firebaseAuthProvider).sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw _handleFirebaseError(e);
    }
  }

  Future<void> sendEmailVerification() async {
    await ref.read(firebaseAuthProvider).currentUser?.sendEmailVerification();
  }

  String _handleFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return 'An account already exists with this email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'weak-password':
        return 'The password provided is too weak.';
      default:
        return 'An error occurred: ${e.message}';
    }
  }
}
