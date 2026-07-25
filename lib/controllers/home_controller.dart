import 'package:flutter/material.dart';

import '../models/profissional.dart';
import '../repositories/profissional_repository.dart';


class HomeController extends ChangeNotifier {

  final ProfissionalRepository _repository =
      ProfissionalRepository();


  List<Profissional> profissionais = [];


  bool carregando = false;


  String? erro;


  Future<void> carregarProfissionais() async {

    carregando = true;
    erro = null;

    notifyListeners();


    try {

      profissionais =
          await _repository.buscarProfissionais();


    } catch (e) {

      erro = e.toString();

    }


    carregando = false;

    notifyListeners();
  }


  Future<void> atualizarLista() async {

    await carregarProfissionais();

  }

}