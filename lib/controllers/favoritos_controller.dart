import 'package:flutter/material.dart';

import '../models/profissional.dart';
import '../repositories/favoritos_repository.dart';

class FavoritosController extends ChangeNotifier {
  final FavoritosRepository repository = FavoritosRepository();

  List<Profissional> favoritos = [];

  bool carregando = false;

  Future<void> carregarFavoritos(String usuarioId) async {
    carregando = true;
    notifyListeners();

    favoritos = await repository.buscarFavoritos(usuarioId);

    carregando = false;
    notifyListeners();
  }

  Future<void> removerFavorito(
      String usuarioId,
      String profissionalId,
      ) async {
    await repository.removerFavorito(usuarioId, profissionalId);

    favoritos.removeWhere(
      (profissional) => profissional.id == profissionalId,
    );

    notifyListeners();
  }
}