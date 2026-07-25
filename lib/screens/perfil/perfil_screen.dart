import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // Foto de Perfil
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/user.png"),
              // Caso ainda não tenha imagem, pode usar:
              // child: Icon(Icons.person, size: 60),
            ),

            const SizedBox(height: 15),

            const Text(
              "João da Silva",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "joao@email.com",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Card(
              elevation: 2,
              child: Column(
                children: [

                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Telefone"),
                    subtitle: const Text("(82) 99999-9999"),
                  ),

                  const Divider(height: 1),

                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text("Endereço"),
                    subtitle: const Text(
                      "Rua Exemplo, 120\nCentro - Maceió/AL",
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {

                  // Navegar para editar perfil

                },
                icon: const Icon(Icons.edit),
                label: const Text("Editar Perfil"),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {

                  // Logout

                },
                icon: const Icon(Icons.logout),
                label: const Text("Sair"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}