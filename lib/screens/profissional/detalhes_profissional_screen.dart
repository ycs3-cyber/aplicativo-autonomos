import 'package:flutter/material.dart';

class DetalheProfissionalScreen extends StatelessWidget {
  const DetalheProfissionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Profissional"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Favoritar
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // FOTO
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.grey.shade300,
              child: const Icon(
                Icons.person,
                size: 120,
                color: Colors.white,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Carlos Henrique",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Eletricista",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: const [

                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      SizedBox(width: 5),

                      Text(
                        "4.8 (52 avaliações)",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: const [

                      Icon(Icons.location_on),

                      SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          "Boa Viagem - Recife/PE",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "Descrição",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Profissional especializado em instalações elétricas, manutenção residencial e comercial, troca de fiação, quadros de distribuição e instalação de chuveiros.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Galeria",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {

                        return Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.image,
                            size: 50,
                          ),
                        );

                      },
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 10),
                      itemCount: 5,
                    ),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Abrir WhatsApp
                      },
                      icon: const Icon(Icons.chat),
                      label: const Text(
                        "Conversar no WhatsApp",
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Ligar
                      },
                      icon: const Icon(Icons.phone),
                      label: const Text(
                        "Ligar",
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}