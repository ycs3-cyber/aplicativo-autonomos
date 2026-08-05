import 'endereco.dart';

class Usuario {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String fotoPerfil;
  final Endereco? endereco;
  final List<String> favoritos;

  const Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.fotoPerfil,
    this.endereco,
    this.favoritos = const [],
  });

  static Future<Usuario?> fromMap(Map<String, dynamic> data) async {
    try {
      final id = data['id'] as String? ?? '';
      if (id.isEmpty) return null;

      final nome = data['nome'] as String? ?? '';
      final email = data['email'] as String? ?? '';
      final telefone = data['telefone'] as String? ?? '';
      final fotoPerfil = data['fotoPerfil'] as String? ?? '';

      Endereco? endereco;
      if (data['endereco'] != null && data['endereco'] is Map<String, dynamic>) {
        endereco = Endereco.fromMap(data['endereco'] as Map<String, dynamic>);
      }

      List<String> favoritos = [];
      if (data['favoritos'] is List) {
        favoritos = (data['favoritos'] as List).map((e) => e.toString()).toList();
      }

      return Usuario(
        id: id,
        nome: nome,
        email: email,
        telefone: telefone,
        fotoPerfil: fotoPerfil,
        endereco: endereco,
        favoritos: favoritos,
      );
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'fotoPerfil': fotoPerfil,
      'endereco': endereco?.toMap(),
      'favoritos': favoritos,
    };
  }
}