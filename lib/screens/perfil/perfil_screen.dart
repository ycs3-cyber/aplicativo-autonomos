import 'package:flutter/material.dart';
import 'package:projeto_autonomos/controllers/perfil_controller.dart';
import '../../models/usuario.dart';



class PerfilScreen extends StatefulWidget {
  final PerfilController controller;

  const PerfilScreen({
    super.key,
    required this.controller,
  });

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  Usuario? usuario;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarPerfil();
  }

  Future<void> carregarPerfil() async {
    final dados = await widget.controller.carregarUsuario();

    setState(() {
      usuario = dados;
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (carregando) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (usuario == null) {
      return const Scaffold(
        body: Center(
          child: Text("Usuário não encontrado."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            CircleAvatar(
              radius: 60,
              backgroundImage: usuario!.fotoPerfil.isNotEmpty
                  ? NetworkImage(usuario!.fotoPerfil)
                  : null,
              child: usuario!.fotoPerfil.isEmpty
                  ? const Icon(Icons.person, size: 60)
                  : null,
            ),

            const SizedBox(height: 20),

            Text(
              usuario!.nome,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ListTile(
              leading: const Icon(Icons.email),
              title: Text(usuario!.email),
            ),

            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(usuario!.telefone),
            ),

            if (usuario!.endereco != null)
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(
                  "${usuario!.endereco!.cidade} - ${usuario!.endereco!.estado}",
                ),
                subtitle: Text(
                  "${usuario!.endereco!.logradouro}, ${usuario!.endereco!.numero}",
                ),
              ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.edit),
                label: const Text("Editar Perfil"),
                onPressed: () {

                  // Navegar para editar perfil

                },
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),

                icon: const Icon(Icons.logout),

                label: const Text("Sair"),

                onPressed: () async {

                  await widget.controller.logout();

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 