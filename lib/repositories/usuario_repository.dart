import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = AuthController();

  Future<void> _logout() async {
    // Será implementado quando criarmos o logout.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Logout ainda não implementado."),
      ),
    );

    /*
    await _authController.logout();

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
    */
  }

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _authController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Quebra Galho"),
            centerTitle: true,
          ),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.handyman_rounded,
                    size: 90,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Login realizado com sucesso!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Bem-vindo ao Quebra Galho.\nSeu login foi realizado com sucesso.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 40),

                  CustomButton(
                    isLoading: _authController.isLoading,
                    onPressed: _logout,
                    child: const Text("Sair"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}