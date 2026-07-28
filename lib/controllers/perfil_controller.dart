import 'package:projeto_autonomos/controllers/perfil_controller.dart' as repository;

import '../models/usuario.dart';
import '../repositories/usuario_repository.dart';

class PerfilController {

  final UsuarioRepository repository;

  PerfilController(this.repository);

  Future<Usuario?> carregarUsuario() async {
    return await repository.buscarUsuarioLogado();
  }

  Future<void> atualizarUsuario(Usuario usuario) async {
    await repository.atualizarUsuario(usuario);
  }

  Future<void> logout() async {}

}

Future<void> logout() async {
  await repository.logout();
} 