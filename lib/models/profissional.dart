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
  final double notaMedia;
  final int quantidadeAvaliacoes;
  final List<String> galeriaFotos;

  const Profissional({
    required this.id,
    required this.nome,
    required this.fotoPerfil,
    required this.categoria,
    required this.descricao,
    required this.cidade,
    required this.bairro,
    required this.telefone,
    required this.whatsapp,
    this.notaMedia = 0.0,
    this.quantidadeAvaliacoes = 0,
    this.galeriaFotos = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'fotoPerfil': fotoPerfil,
      'categoria': categoria,
      'descricao': descricao,
      'cidade': cidade,
      'bairro': bairro,
      'telefone': telefone,
      'whatsapp': whatsapp,
      'notaMedia': notaMedia,
      'quantidadeAvaliacoes': quantidadeAvaliacoes,
      'galeriaFotos': galeriaFotos,
    };
  }

  factory Profissional.fromMap(Map<String, dynamic> map) {
    return Profissional(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      fotoPerfil: map['fotoPerfil'] ?? '',
      categoria: map['categoria'] ?? '',
      descricao: map['descricao'] ?? '',
      cidade: map['cidade'] ?? '',
      bairro: map['bairro'] ?? '',
      telefone: map['telefone'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      notaMedia: (map['notaMedia'] ?? 0).toDouble(),
      quantidadeAvaliacoes: map['quantidadeAvaliacoes'] ?? 0,
      galeriaFotos: List<String>.from(map['galeriaFotos'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Profissional.fromJson(String source) =>
      Profissional.fromMap(json.decode(source));
}