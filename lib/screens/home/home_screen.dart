import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';
import '../../models/profissional.dart';
import '../../widgets/home/profissional_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autônomos")),

      body: FutureBuilder<List<Profissional>>(
        future: controller.carregarProfissionais(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nenhum profissional encontrado."));
          }

          final profissionais = snapshot.data!;

          return ListView.builder(
            itemCount: profissionais.length,

            itemBuilder: (context, index) {
              return ProfissionalCard(profissional: profissionais[index]);
            },
          );
        },
      ),
    );
  }
}
