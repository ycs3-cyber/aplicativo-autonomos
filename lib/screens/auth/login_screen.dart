import 'package:flutter/material.dart';
import 'package:projeto_autonomos/routes/app_routes.dart';

import '../../config/app_routes.dart';
import '../../config/constants.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class Logo extends StatelessWidget {
  final double size;
  final String title;
  final String subtitle;

  const Logo({
    super.key,
    required this.size,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: const FlutterLogo(),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _authController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final erro = await _authController.login();

    if (!mounted) return;

    if (erro == null) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(erro),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _authController,
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.padding),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Logo(
                        size: 170,
                        title: "Bem-vindo!",
                        subtitle:
                            "Encontre profissionais de confiança perto de você.",
                      ),

                      const SizedBox(height: 40),

                      TextFormField(
                        controller: _authController.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        decoration: const InputDecoration(
                          labelText: "E-mail",
                          hintText: "Digite seu e-mail",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe seu e-mail";
                          }

                          final regex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );

                          if (!regex.hasMatch(value)) {
                            return "E-mail inválido";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      TextFormField(
                        controller: _authController.senhaController,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [
                          AutofillHints.password,
                        ],
                        decoration: const InputDecoration(
                          labelText: "Senha",
                          hintText: "Digite sua senha",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        onFieldSubmitted: (_) => _login(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Informe sua senha";
                          }

                          if (value.length < 6) {
                            return "A senha deve possuir pelo menos 6 caracteres.";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.recuperarSenha,
                            );
                          },
                          child: const Text("Esqueci minha senha"),
                        ),
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        isLoading: _authController.isLoading,
                        onPressed:
                            _authController.isLoading ? null : _login,
                        child: const Text(
                          "Entrar",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Ainda não possui conta?"),

                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.cadastro,
                              );
                            },
                            child: const Text("Cadastre-se"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}