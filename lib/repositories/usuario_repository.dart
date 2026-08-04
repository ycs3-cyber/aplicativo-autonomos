import 'package:firebase_auth/firebase_auth.dart';

import '../services/firebase/auth_service.dart';

class UsuarioRepository {
  final AuthService _authService = AuthService();

  /// Login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _authService.signIn(
      email: email,
      password: password,
    );
  }

  /// Logout
  Future<void> logout() {
    return _authService.signOut();
  }

  /// Recuperação de senha
  Future<void> resetPassword({
    required String email,
  }) {
    return _authService.sendPasswordResetEmail(
      email: email,
    );
  }
}