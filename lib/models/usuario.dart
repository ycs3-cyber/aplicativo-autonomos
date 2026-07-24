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
}