import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../widgets/logo.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Depois chamaremos o AuthController
      debugPrint("Email: ${_emailController.text}");
      debugPrint("Senha: ${_senhaController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  const AppLogo(
                    size: 170,
                    title: "Bem-vindo!",
                    subtitle:
                        "Encontre profissionais de confiança perto de você.",
                  ),

                  const SizedBox(height: 40),

                  CustomTextField(
                    controller: _emailController,
                    label: "E-mail",
                    hint: "Digite seu e-mail",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe seu e-mail";
                      }

                      if (!value.contains("@")) {
                        return "E-mail inválido";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomTextField(
                    controller: _senhaController,
                    label: "Senha",
                    hint: "Digite sua senha",
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe sua senha";
                      }

                      if (value.length < 6) {
                        return "Mínimo de 6 caracteres";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Recuperar senha
                      },
                      child: const Text("Esqueci minha senha"),
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomButton(
                    child: const Text("Entrar"),
                    onPressed: _login, text: '',
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Ainda não possui conta?"),

                      TextButton(
                        onPressed: () {
                          // Cadastro
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
  }
}