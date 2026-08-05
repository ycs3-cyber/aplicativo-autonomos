import 'dart:convert';

class Profissional {
  final String id;
  final String nome;
  final String fotoPerfil;
  final String categoria;
  final String descricao;
  final String cidade;
  final String bairro;
  final String telefone;
  final String whatsapp;
  final double avaliacao;
  final List<String> galeriaFotos;

  const Profissional({
    required this.id,
    required this.nome,
    this.fotoPerfil = '',
    required this.categoria,
    required this.descricao,
    required this.cidade,
    required this.bairro,
    required this.telefone,
    this.whatsapp = '',
    this.avaliacao = 0.0,
    this.galeriaFotos = const [],
  });


  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'fotoPerfil': fotoPerfil,
      'categoria': categoria,
      'descricao': descricao,
      'cidade': cidade,
      'bairro': bairro,
      'telefone': telefone,
      'whatsapp': whatsapp,
      'avaliacao': avaliacao,
      'galeriaFotos': galeriaFotos,
    };
  }


  factory Profissional.fromMap(
    Map<String, dynamic> map,
    String id,
  ) {
    return Profissional(
      id: id,
      nome: map['nome'] ?? '',
      fotoPerfil: map['fotoPerfil'] ?? '',
      categoria: map['categoria'] ?? '',
      descricao: map['descricao'] ?? '',
      cidade: map['cidade'] ?? '',
      bairro: map['bairro'] ?? '',
      telefone: map['telefone'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      avaliacao: (map['avaliacao'] ?? 0).toDouble(),
      galeriaFotos:
          List<String>.from(map['galeriaFotos'] ?? []),
    );
  }


  String toJson() => json.encode(toMap());


  factory Profissional.fromJson(String source) =>
      Profissional.fromMap(
        json.decode(source),
        '',
      );
}