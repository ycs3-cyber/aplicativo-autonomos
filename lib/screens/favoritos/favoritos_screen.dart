import 'package:flutter/material.dart';

import '../../controllers/favoritos_controller.dart';
import '../../widgets/profissional_card.dart';

class FavoritosScreen extends StatefulWidget {
  const FavoritosScreen({super.key});

  @override
  State<FavoritosScreen> createState() => _FavoritosScreenState();
}

class _FavoritosScreenState extends State<FavoritosScreen> {
  final FavoritosController controller = FavoritosController();

  @override
  void initState() {
    super.initState();

    controller.carregarFavoritos(
      "ID_DO_USUARIO",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          if (controller.carregando) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.favoritos.isEmpty) {
            return const Center(
              child: Text(
                "Nenhum profissional favoritado.",
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.favoritos.length,
            itemBuilder: (_, index) {
              final profissional =
                  controller.favoritos[index];

              return ProfissionalCard(
                profissional: profissional,
              );
            },
          );
        },
      ),
    );
  }

}