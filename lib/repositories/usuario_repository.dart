import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/usuario.dart';
import '../services/firebase/auth_service.dart';

class UsuarioRepository {
  final AuthService _authService = AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ============================
  // LOGIN
  // ============================

  Future<UserCredential> login({
    required String email,
    required String password,
  }) {
    return _authService.signIn(
      email: email,
      password: password,
    );
  }

  // ============================
  // LOGOUT
  // ============================

  Future<void> logout() {
    return _authService.signOut();
  }

  // ============================
  // RECUPERAR SENHA
  // ============================

  Future<void> resetPassword({
    required String email,
  }) {
    return _authService.sendPasswordResetEmail(
      email: email,
    );
  }

  // ============================
  // CADASTRAR USUÁRIO
  // ============================

  Future<void> cadastrarUsuario({
    required Usuario usuario,
    required String senha,
  }) async {
    try {
      final credencial = await _auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: senha,
      );

      final uid = credencial.user!.uid;

      final novoUsuario = Usuario(
        id: uid,
        nome: usuario.nome,
        email: usuario.email,
        telefone: usuario.telefone,
        fotoPerfil: usuario.fotoPerfil,
        endereco: usuario.endereco,
        favoritos: usuario.favoritos,
      );

      await _firestore
          .collection("usuarios")
          .doc(uid)
          .set(novoUsuario.toMap());
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "Erro ao cadastrar usuário");
    } catch (_) {
      throw Exception("Erro inesperado ao cadastrar usuário");
    }
  }

  // ============================
  // BUSCAR USUÁRIO LOGADO
  // ============================

  Future<Usuario?> buscarUsuarioLogado() async {
    try {
      final usuarioFirebase = _auth.currentUser;

      if (usuarioFirebase == null) {
        return null;
      }

      final doc = await _firestore
          .collection("usuarios")
          .doc(usuarioFirebase.uid)
          .get();

      if (!doc.exists) {
        return null;
      }

      return Usuario.fromMap(
        doc.data() as Map<String, dynamic>,
      );
    } catch (_) {
      throw Exception("Erro ao buscar usuário");
    }
  }

  // ============================
  // ATUALIZAR USUÁRIO
  // ============================

  Future<void> atualizarUsuario(Usuario usuario) async {
    try {
      await _firestore
          .collection("usuarios")
          .doc(usuario.id)
          .update(usuario.toMap());
    } catch (_) {
      throw Exception("Erro ao atualizar usuário");
    }
  }
}