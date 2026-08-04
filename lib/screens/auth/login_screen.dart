import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controllers/auth_controller.dart';
import '../../exceptions/auth_exception.dart';
import '../../routes/app_routes.dart';
import '../../utils/validators.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _authController = AuthController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _authController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await _authController.login(
        email: _emailController.text.trim(),
        password: _senhaController.text,
      );

      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,
      );
    } on AuthException catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Ocorreu um erro inesperado.",
          ),
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
                  child: AutofillGroup(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const AppLogo(
                          size: 280,
                          title: "Bem-vindo!",
                          subtitle:
                              "Encontre profissionais de confiança perto de você.",
                        ),

                        const SizedBox(height: 40),

                        CustomTextField(
                          controller: _emailController,
                          label: "E-mail",
                          hint: "Digite seu e-mail",
                          prefixIcon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.email,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [
                            AutofillHints.email,
                          ],
                        ),

                        const SizedBox(height: 20),

                        CustomTextField(
                          controller: _senhaController,
                          label: "Senha",
                          hint: "Digite sua senha",
                          prefixIcon: Icons.lock_outline,
                          obscureText: true,
                          validator: Validators.password,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [
                            AutofillHints.password,
                          ],
                          onFieldSubmitted: (_) => _login(),
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
                            child: const Text(
                              "Esqueci minha senha",
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        CustomButton(
                          isLoading: _authController.isLoading,
                          onPressed: _authController.isLoading
                              ? null
                              : _login,
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Ainda não possui conta?",
                            ),
                            TextButton(
                              onPressed: () {
                                // Quando criarmos a CadastroScreen:
                                // Navigator.pushNamed(
                                //   context,
                                //   AppRoutes.cadastro,
                                // );
                              },
                              child: const Text(
                                "Cadastre-se",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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