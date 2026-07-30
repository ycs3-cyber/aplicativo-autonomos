import '../models/profissional.dart';
import '../repositories/profissional_repository.dart';

class HomeController {
  final ProfissionalRepository _repository = ProfissionalRepository();

  Future<List<Profissional>> carregarProfissionais() async {
    return await _repository.buscarTodos();
  }

  Future<List<Profissional>> buscarPorCategoria(String categoria) async {
    return await _repository.buscarPorCategoria(categoria);
  }

  Future<List<Profissional>> pesquisar(String texto) async {
    return await _repository.buscarPorNome(texto);
  }
}