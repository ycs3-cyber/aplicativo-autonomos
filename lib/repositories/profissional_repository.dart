import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/profissional.dart';


class ProfissionalRepository {


  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;



  Future<List<Profissional>> buscarProfissionais() async {


    try {


      QuerySnapshot snapshot =
          await _firestore
              .collection("profissionais")
              .get();



      return snapshot.docs.map((doc) {


        return Profissional.fromMap(
          doc.data() as Map<String, dynamic>,
        );


      }).toList();



    } catch (e) {


      throw Exception(
        "Erro ao buscar profissionais: $e",
      );


    }

  }



  Future<Profissional?> buscarProfissionalPorId(
      String id) async {


    try {


      DocumentSnapshot doc =
          await _firestore
              .collection("profissionais")
              .doc(id)
              .get();



      if (!doc.exists) {

        return null;

      }



      return Profissional.fromMap(
        doc.data() as Map<String, dynamic>,
      );



    } catch (e) {

      throw Exception(
        "Erro ao buscar profissional",
      );

    }

  }

}