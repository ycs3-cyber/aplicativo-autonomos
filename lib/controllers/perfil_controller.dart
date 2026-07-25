import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../repositories/usuario_repository.dart';

class PerfilController extends ChangeNotifier {
  final UsuarioRepository _repository = UsuarioRepository();

  Usuario? usuario;

  bool carregando = false;

  /// Busca os dados do usuário logado
  Future<void> carregarUsuario() async {
    carregando = true;
    notifyListeners();

    try {
      usuario = await _repository.buscarUsuarioLogado();
    } catch (e) {
      debugPrint("Erro ao carregar usuário: $e");
    }

    carregando = false;
    notifyListeners();
  }

  /// Logout
  Future<void> logout() async {
    await _repository.logout();
  }

  /// Atualiza as informações do perfil
  Future<void> atualizarUsuario(Usuario usuarioAtualizado) async {
    await _repository.atualizarUsuario(usuarioAtualizado);

    usuario = usuarioAtualizado;

    notifyListeners();
  }
}