import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Usuário autenticado
  User? get currentUser => _auth.currentUser;

  /// Login
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
    throw Exception(_getErrorMessage(e.code));
  }
}

  /// Cadastro
  Future<UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    throw UnimplementedError();
  }

  /// Recuperação de senha
  Future<void> resetPassword({
    required String email,
  }) async {
    throw UnimplementedError();
  }

  /// Logout
  Future<void> signOut() async {
    throw UnimplementedError();
  }
  
  String _getErrorMessage(String code) {
  switch (code) {
    case 'user-not-found':
      return 'Usuário não encontrado.';

    case 'wrong-password':
      return 'Senha incorreta.';

    case 'invalid-email':
      return 'E-mail inválido.';

    case 'invalid-credential':
      return 'E-mail ou senha inválidos.';

    case 'user-disabled':
      return 'Usuário desativado.';

    case 'too-many-requests':
      return 'Muitas tentativas. Tente novamente mais tarde.';

    case 'network-request-failed':
      return 'Sem conexão com a internet.';

    default:
      return 'Erro ao realizar login.';
  }
}
}