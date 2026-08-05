import 'package:flutter/material.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/home_controller.dart';
import '../../models/profissional.dart';
import '../../routes/app_routes.dart';
import '../../widgets/home/profissional_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();
  final AuthController authController = AuthController();
  late final Future<List<Profissional>> _future;

  @override
  void initState() {
    super.initState();
    _future = controller.carregarProfissionais();
  }

  Future<void> _logout() async {
    await authController.logout();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
  }

  @override
  void dispose() {
    authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quebra Galho"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<List<Profissional>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Erro ao carregar profissionais:\n${snapshot.error}",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final profissionais = snapshot.data ?? [];

          if (profissionais.isEmpty) {
            return const Center(
              child: Text("Nenhum profissional encontrado."),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: profissionais.length,
            itemBuilder: (context, index) {
              return ProfissionalCard(
                profissional: profissionais[index],
              );
            },
          );
        },
      ),
    );
  }
}