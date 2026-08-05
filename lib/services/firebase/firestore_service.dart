import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/profissional.dart';

class FirestoreService {

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Profissional>> buscarProfissionais() async {

    final snapshot =
        await _db.collection('profissionais').get();

    return snapshot.docs
        .map((doc) => Profissional.fromMap(doc.data()))
        .toList();
  }

  Future<List<Profissional>> buscarProfissionaisCategoria(
      String categoria) async {

    final snapshot = await _db
        .collection('profissionais')
        .where('categoria', isEqualTo: categoria)
        .get();

    return snapshot.docs
        .map((doc) => Profissional.fromMap(doc.data()))
        .toList();
  }

  Future<List<Profissional>> buscarProfissionaisNome(
      String nome) async {

    final snapshot = await _db.collection('profissionais').get();

    return snapshot.docs
        .map((doc) => Profissional.fromMap(doc.data()))
        .where((p) =>
            p.nome.toLowerCase().contains(nome.toLowerCase()))
        .toList();
  }
}
