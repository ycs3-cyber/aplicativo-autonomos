import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/usuario.dart';

class UsuarioRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Retorna o usuário logado
  Future<Usuario?> buscarUsuarioLogado() async {
    try {
      final User? firebaseUser = _auth.currentUser;

      if (firebaseUser == null) {
        return null;
      }

      final DocumentSnapshot<Map<String, dynamic>> doc =
          await _firestore
              .collection("usuarios")
              .doc(firebaseUser.uid)
              .get();

      if (!doc.exists) {
        return null;
      }

      return Usuario.fromMap(doc.data()!);
    } catch (e) {
      throw Exception("Erro ao buscar usuário: $e");
    }
  }

  /// Atualiza os dados do usuário
  Future<void> atualizarUsuario(Usuario usuario) async {
    try {
      await _firestore
          .collection("usuarios")
          .doc(usuario.id)
          .update(usuario.toMap());
    } catch (e) {
      throw Exception("Erro ao atualizar usuário: $e");
    }
  }

  /// Faz logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Erro ao realizar logout: $e");
    }
  }
}