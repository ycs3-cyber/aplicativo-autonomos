import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_autonomos/models/profissional.dart';

class ProfissionalRepository {

  Future<Profissional> buscarPorId(String id) async {

    final doc = await FirebaseFirestore.instance
        .collection("profissionais")
        .doc(id)
        .get();

    return Profissional.fromMap(doc.data()!);

  }

}