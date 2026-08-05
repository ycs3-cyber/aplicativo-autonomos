import 'package:flutter/material.dart';
import 'package:projeto_autonomos/models/profissional.dart';

class ProfissionalCard extends StatelessWidget {
  final Profissional profissional;

  const ProfissionalCard({
    super.key,
    required this.profissional,
  });

  @override
  Widget build(BuildContext context) {
    final localizacao = [
      profissional.cidade,
      profissional.bairro,
    ].where((value) => value.trim().isNotEmpty).join(' • ');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: profissional.fotoPerfil.isNotEmpty
                  ? NetworkImage(profissional.fotoPerfil)
                  : null,
              child: profissional.fotoPerfil.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profissional.nome,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    profissional.categoria,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (localizacao.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(localizacao),
                  ],
                  if (profissional.descricao.trim().isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      profissional.descricao,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Colors.amber[700],
                      ),
                      const SizedBox(width: 4),
                      Text(profissional.avaliacao.toStringAsFixed(1)),
                      const Spacer(),
                      Text(
                        profissional.telefone.isNotEmpty
                            ? profissional.telefone
                            : 'Contato',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
