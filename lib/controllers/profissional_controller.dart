import 'package:flutter/foundation.dart';
import 'package:projeto_autonomos/models/profissional.dart';
import 'package:projeto_autonomos/repositories/profissional_repository.dart';

class ProfissionalController extends ChangeNotifier {
  final ProfissionalRepository repository =
      ProfissionalRepository();

  Profissional? profissional;

  Future<void> carregarProfissional(String id) async {
    profissional = await repository.buscarPorId(id);
    notifyListeners();
  }
}