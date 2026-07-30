import '../models/profissional.dart';
import '../services/firebase/firestore_service.dart';

class ProfissionalRepository {
  final FirestoreService _firestore = FirestoreService();

  Future<List<Profissional>> buscarTodos() async {
    return await _firestore.buscarProfissionais();
  }

  Future<List<Profissional>> buscarPorCategoria(String categoria) async {
    return await _firestore.buscarProfissionaisCategoria(categoria);
  }

  Future<List<Profissional>> buscarPorNome(String nome) async {
    return await _firestore.buscarProfissionaisNome(nome);
  }
}