import 'package:flutter/material.dart';

import '../../models/profissional.dart';

class DetalhesProfissionalScreen extends StatelessWidget {
  final Profissional profissional;

  const DetalhesProfissionalScreen({
    super.key,
    required this.profissional,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Profissional"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// FOTO
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(profissional.fotoPerfil),
              ),
            ),

            const SizedBox(height: 20),

            /// NOME
            Center(
              child: Text(
                profissional.nome,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            /// CATEGORIA
            Center(
              child: Chip(
                label: Text(profissional.categoria),
              ),
            ),

            const SizedBox(height: 15),

            /// AVALIAÇÃO
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  profissional.notaMedia.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  " (${profissional.quantidadeAvaliacoes} avaliações)",
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// DESCRIÇÃO
            const Text(
              "Descrição",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              profissional.descricao,
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 30),

            /// LOCALIZAÇÃO
            const Text(
              "Área de atuação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "${profissional.bairro} - ${profissional.cidade}",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// CONTATOS
            const Text(
              "Contato",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(profissional.telefone),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.chat),
                title: Text(profissional.whatsapp),
              ),
            ),

            const SizedBox(height: 30),

            /// GALERIA
            const Text(
              "Galeria de Serviços",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profissional.galeriaFotos.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    profissional.galeriaFotos[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            /// BOTÃO FAVORITAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implementar depois
                },
                icon: const Icon(Icons.favorite_border),
                label: const Text("Favoritar"),
              ),
            ),

            const SizedBox(height: 15),

            /// BOTÃO WHATSAPP
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  // Implementar depois
                },
                icon: const Icon(Icons.chat),
                label: const Text("Conversar no WhatsApp"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}