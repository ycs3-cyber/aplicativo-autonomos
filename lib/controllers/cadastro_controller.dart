import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../repositories/usuario_repository.dart';


class CadastroController extends ChangeNotifier {

  final UsuarioRepository _repository =
      UsuarioRepository();


  bool carregando = false;


  Future<String?> cadastrarUsuario({
    required Usuario usuario,
    required String senha,
  }) async {

    carregando = true;
    notifyListeners();


    try {

      await _repository.cadastrarUsuario(
        usuario: usuario,
        senha: senha,
      );


      return null;


    } catch(e) {

      return e.toString();


    } finally {

      carregando = false;
      notifyListeners();

    }

  }

}