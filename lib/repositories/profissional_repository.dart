import '../models/profissional.dart';
import '../services/firebase/firestore_service.dart';

class ProfissionalRepository {
  final FirestoreService _firestore = FirestoreService();

  /// Lista todos os profissionais
  Future<List<Profissional>> buscarTodos() async {
    return _firestore.buscarProfissionais();
  }

  /// Busca por nome
  Future<List<Profissional>> buscarPorNome(String nome) async {
    return _firestore.buscarProfissionaisNome(nome);
  }

  /// Busca por categoria
  Future<List<Profissional>> buscarPorCategoria(
    String categoria,
  ) async {
    return _firestore.buscarProfissionaisCategoria(categoria);
  }

  /// Busca geral (nome ou profissão)
  Future<List<Profissional>> pesquisar(
    String pesquisa,
  ) async {
    return _firestore.buscarProfissionaisPesquisa(
      pesquisa,
    );
  }
}