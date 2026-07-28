import 'package:projeto_autonomos/controllers/perfil_controller.dart' as authService;

import '../models/usuario.dart';
import '../services/firebase/firestore_service.dart';


class UsuarioRepository {

  final FirestoreService firestore;

  UsuarioRepository(this.firestore);

  Future<Usuario?> buscarUsuarioLogado() async {
    return firestore.buscarUsuarioLogado();
  }

  Future<void> atualizarUsuario(Usuario usuario) async {
    return firestore.atualizarUsuario(usuario);
  }

}

Future<void> logout() async {
  await authService.logout();
} 