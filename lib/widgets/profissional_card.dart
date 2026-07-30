import 'package:flutter/material.dart';
import 'package:projeto_autonomos/models/profissional.dart';

class ProfissionalCard extends StatelessWidget {
  final Profissional profissional;

  const ProfissionalCard({super.key, required this.profissional});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text(profissional.nome)));
  }
}