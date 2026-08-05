import 'package:firebase_auth/firebase_auth.dart';

import '../../exceptions/auth_exception.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Usuário atualmente autenticado
  User? get currentUser => _auth.currentUser;

  /// Verifica se existe um usuário logado
  bool get isLogged => currentUser != null;

  /// LOGIN
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getErrorMessage(e));
    }
  }

  /// LOGOUT
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getErrorMessage(e));
    }
  }

  /// RECUPERAÇÃO DE SENHA
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(
        email: email.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getErrorMessage(e));
    }
  }

  /// Traduz os erros do Firebase
  String _getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return 'E-mail inválido.';

      case 'user-not-found':
        return 'Nenhum usuário encontrado com este e-mail.';

      case 'wrong-password':
      case 'invalid-credential':
        return 'E-mail ou senha incorretos.';

      case 'too-many-requests':
        return 'Muitas tentativas. Tente novamente mais tarde.';

      case 'network-request-failed':
        return 'Sem conexão com a internet.';

      case 'user-disabled':
        return 'Esta conta foi desativada.';

      case 'operation-not-allowed':
        return 'Operação não permitida.';

      default:
        return e.message ?? 'Ocorreu um erro inesperado.';
    }
  }
}