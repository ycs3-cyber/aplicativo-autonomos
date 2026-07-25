import 'dart:convert';

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


  // Converte Usuario para Firestore
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


  // Converte Firestore para Usuario
  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      telefone: map['telefone'] ?? '',
      fotoPerfil: map['fotoPerfil'] ?? '',
      endereco: map['endereco'] != null
          ? Endereco.fromMap(
              map['endereco'],
            )
          : null,
      favoritos: List<String>.from(
        map['favoritos'] ?? [],
      ),
    );
  }


  String toJson() {
    return json.encode(toMap());
  }


  factory Usuario.fromJson(String source) {
    return Usuario.fromMap(
      json.decode(source),
    );
  }
}