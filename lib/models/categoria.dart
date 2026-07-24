import 'dart:convert';

class Categoria {
  final String id;
  final String nome;
  final String icone;

  const Categoria({
    required this.id,
    required this.nome,
    this.icone = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'icone': icone,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      icone: map['icone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Categoria.fromJson(String source) =>
      Categoria.fromMap(json.decode(source));
}