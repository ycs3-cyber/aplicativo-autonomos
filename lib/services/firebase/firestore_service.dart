import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../models/profissional.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final String _collection = 'profissionais';


  /// Retorna todos os profissionais
  Future<List<Profissional>> buscarProfissionais() async {
    final snapshot = await _db
        .collection(_collection)
        .get();

    debugPrint('FirestoreService: lendo coleção $_collection');
    debugPrint('FirestoreService: documentos retornados ${snapshot.docs.length}');

    for (final doc in snapshot.docs) {
      debugPrint('FirestoreService: documento ${doc.id} -> ${doc.data()}');
    }

    return snapshot.docs
        .map(
          (doc) => Profissional.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .toList();
  }


  /// Busca por categoria
  Future<List<Profissional>> buscarProfissionaisCategoria(
    String categoria,
  ) async {

    final snapshot = await _db
        .collection(_collection)
        .where(
          'categoria',
          isEqualTo: categoria,
        )
        .get();


    return snapshot.docs
        .map(
          (doc) => Profissional.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .toList();
  }


  /// Busca por nome
  Future<List<Profissional>> buscarProfissionaisNome(
    String nome,
  ) async {

    final snapshot = await _db
        .collection(_collection)
        .get();


    return snapshot.docs
        .map(
          (doc) => Profissional.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .where(
          (p) => p.nome
              .toLowerCase()
              .contains(
                nome.toLowerCase(),
              ),
        )
        .toList();
  }


  /// Busca geral (nome ou categoria)
  Future<List<Profissional>> buscarProfissionaisPesquisa(
    String pesquisa,
  ) async {

    final texto = pesquisa
        .toLowerCase()
        .trim();


    final snapshot = await _db
        .collection(_collection)
        .get();


    return snapshot.docs
        .map(
          (doc) => Profissional.fromMap(
            doc.data(),
            doc.id,
          ),
        )
        .where(
          (p) =>
              p.nome
                  .toLowerCase()
                  .contains(texto) ||
              p.categoria
                  .toLowerCase()
                  .contains(texto),
        )
        .toList();
  }
}