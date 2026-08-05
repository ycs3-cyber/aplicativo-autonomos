import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/profissional.dart';

class FavoritosRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Profissional>> buscarFavoritos(String usuarioId) async {
    final usuarioDoc =
        await _firestore.collection('usuarios').doc(usuarioId).get();

    if (!usuarioDoc.exists) {
      return [];
    }

    final favoritos =
        List<String>.from(usuarioDoc.data()?['favoritos'] ?? []);

    if (favoritos.isEmpty) {
      return [];
    }

    List<Profissional> profissionais = [];

    for (String id in favoritos) {
      final doc =
          await _firestore.collection('profissionais').doc(id).get();

      if (doc.exists) {
        profissionais.add(
          Profissional.fromMap(doc.id as Map<String, dynamic>, doc.data()! as String),
        );
      }
    }

    return profissionais;
  }

  Future<void> adicionarFavorito(
      String usuarioId,
      String profissionalId,
      ) async {
    await _firestore.collection('usuarios').doc(usuarioId).update({
      'favoritos': FieldValue.arrayUnion([profissionalId])
    });
  }

  Future<void> removerFavorito(
      String usuarioId,
      String profissionalId,
      ) async {
    await _firestore.collection('usuarios').doc(usuarioId).update({
      'favoritos': FieldValue.arrayRemove([profissionalId])
    });
  }
}