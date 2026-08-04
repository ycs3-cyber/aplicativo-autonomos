import 'package:flutter/material.dart';

import '../exceptions/auth_exception.dart';
import '../repositories/usuario_repository.dart';

class AuthController extends ChangeNotifier {
  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// LOGIN
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);

      await _usuarioRepository.login(
        email: email,
        password: password,
      );
    } on AuthException {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  /// LOGOUT
  Future<void> logout() async {
    try {
      _setLoading(true);

      await _usuarioRepository.logout();
    } finally {
      _setLoading(false);
    }
  }

  /// RECUPERAÇÃO DE SENHA
  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      _setLoading(true);

      await _usuarioRepository.resetPassword(
        email: email,
      );
    } on AuthException {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }
}