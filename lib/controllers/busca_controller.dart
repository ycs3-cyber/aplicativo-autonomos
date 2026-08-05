import 'package:flutter/material.dart';

import '../models/profissional.dart';
import '../repositories/profissional_repository.dart';

class BuscaController extends ChangeNotifier {
  final ProfissionalRepository _repository =
      ProfissionalRepository();

  bool _isLoading = false;

  List<Profissional> _profissionais = [];

  bool get isLoading => _isLoading;

  List<Profissional> get profissionais => _profissionais;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Carrega todos os profissionais
  Future<void> carregarProfissionais() async {
    try {
      _setLoading(true);

      _profissionais =
          await _repository.buscarTodos();
    } finally {
      _setLoading(false);
    }
  }

  /// Pesquisa por nome ou profissão
  Future<void> pesquisar(
    String texto,
  ) async {
    try {
      _setLoading(true);

      if (texto.trim().isEmpty) {
        _profissionais =
            await _repository.buscarTodos();
      } else {
        _profissionais =
            await _repository.pesquisar(texto);
      }
    } finally {
      _setLoading(false);
    }
  }

  /// Pesquisa por categoria
  Future<void> pesquisarCategoria(
    String categoria,
  ) async {
    try {
      _setLoading(true);

      _profissionais =
          await _repository.buscarPorCategoria(
        categoria,
      );
    } finally {
      _setLoading(false);
    }
  }
}