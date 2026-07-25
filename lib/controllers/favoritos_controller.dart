import 'package:flutter/material.dart';

import '../repositories/favoritos_repository.dart';

class FavoritosController extends ChangeNotifier {
  final FavoritosRepository _repository = FavoritosRepository();

  List<String> favoritos = [];

  bool carregando = false;

  Future<void> carregarFavoritos() async {
    carregando = true;
    notifyListeners();

    favoritos = await _repository.buscarFavoritos();

    carregando = false;
    notifyListeners();
  }

  Future<void> adicionarFavorito(String profissionalId) async {
    await _repository.adicionarFavorito(profissionalId);

    if (!favoritos.contains(profissionalId)) {
      favoritos.add(profissionalId);
    }

    notifyListeners();
  }

  Future<void> removerFavorito(String profissionalId) async {
    await _repository.removerFavorito(profissionalId);

    favoritos.remove(profissionalId);

    notifyListeners();
  }

  bool ehFavorito(String profissionalId) {
    return favoritos.contains(profissionalId);
  }
}