import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Autônomos"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Ir para Perfil
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("João da Silva"),
              accountEmail: Text("joao@email.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Início"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Favoritos"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Meu Perfil"),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configurações"),
              onTap: () {},
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const Text(
              "Olá, João 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Encontre o profissional ideal para você.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 25),

            TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar profissional...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Categorias",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [

                  CategoriaCard(
                    icone: Icons.electrical_services,
                    titulo: "Eletricista",
                  ),

                  CategoriaCard(
                    icone: Icons.plumbing,
                    titulo: "Encanador",
                  ),

                  CategoriaCard(
                    icone: Icons.format_paint,
                    titulo: "Pintor",
                  ),

                  CategoriaCard(
                    icone: Icons.cleaning_services,
                    titulo: "Diarista",
                  ),

                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Profissionais em Destaque",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const ProfissionalCard(
              nome: "Carlos Henrique",
              profissao: "Eletricista",
              cidade: "Maceió",
              nota: 4.8,
            ),

            const SizedBox(height: 10),

            const ProfissionalCard(
              nome: "Maria Oliveira",
              profissao: "Diarista",
              cidade: "Maceió",
              nota: 4.9,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriaCard extends StatelessWidget {

  final IconData icone;
  final String titulo;

  const CategoriaCard({
    super.key,
    required this.icone,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icone,
            size: 35,
            color: Colors.blue,
          ),

          const SizedBox(height: 10),

          Text(
            titulo,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProfissionalCard extends StatelessWidget {

  final String nome;
  final String profissao;
  final String cidade;
  final double nota;

  const ProfissionalCard({
    super.key,
    required this.nome,
    required this.profissao,
    required this.cidade,
    required this.nota,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(

        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),

        title: Text(nome),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(profissao),

            Text(cidade),

            Row(
              children: [

                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 18,
                ),

                Text(nota.toString()),

              ],
            ),

          ],
        ),

        trailing: IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            // Favoritar
          },
        ),

        onTap: () {
          // Abrir detalhes do profissional
        },
      ),
    );
  }
}