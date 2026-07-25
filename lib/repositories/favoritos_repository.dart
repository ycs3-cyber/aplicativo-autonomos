import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<String>> buscarFavoritos() async {
    final usuario = _auth.currentUser;

    if (usuario == null) return [];

    final doc = await _firestore
        .collection("usuarios")
        .doc(usuario.uid)
        .get();

    if (!doc.exists) return [];

    final dados = doc.data();

    if (dados == null) return [];

    return List<String>.from(dados["favoritos"] ?? []);
  }

  Future<void> adicionarFavorito(String profissionalId) async {
    final usuario = _auth.currentUser;

    if (usuario == null) return;

    await _firestore
        .collection("usuarios")
        .doc(usuario.uid)
        .update({
      "favoritos": FieldValue.arrayUnion([profissionalId])
    });
  }

  Future<void> removerFavorito(String profissionalId) async {
    final usuario = _auth.currentUser;

    if (usuario == null) return;

    await _firestore
        .collection("usuarios")
        .doc(usuario.uid)
        .update({
      "favoritos": FieldValue.arrayRemove([profissionalId])
    });
  }
}