import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// If the real UsuarioRepository is missing or import path is incorrect,
// provide a minimal local implementation to satisfy references.
// Remove this or adjust import when the actual repository is available.
// keep original import commented for clarity
// import 'package:projeto_autonomos/repositories/usuario_repository.dart';

class UsuarioRepository {
  Future<void> login({required String email, required String password}) async {
    // Minimal placeholder: simulate network delay
    await Future.delayed(const Duration(milliseconds: 200));
    // In a real implementation, perform authentication and throw on failure.
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email or password cannot be empty');
    }
  }
}

class AuthController extends ChangeNotifier {
  AuthController();

  final UsuarioRepository _usuarioRepository = UsuarioRepository();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<String?> login() async {
    try {
      _setLoading(true);

      await _usuarioRepository.login(
        email: emailController.text,
        password: senhaController.text,
      );

      return null;
    } catch (e) {
      return e.toString().replaceFirst('Exception: ', '');
    } finally {
      _setLoading(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}