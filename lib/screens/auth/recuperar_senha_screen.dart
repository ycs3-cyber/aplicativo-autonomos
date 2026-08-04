import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../controllers/auth_controller.dart';
import '../../exceptions/auth_exception.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../utils/validators.dart';

class RecuperarSenhaScreen extends StatefulWidget {
  const RecuperarSenhaScreen({super.key});

  @override
  State<RecuperarSenhaScreen> createState() =>
      _RecuperarSenhaScreenState();
}

class _RecuperarSenhaScreenState
    extends State<RecuperarSenhaScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _authController = AuthController();

  @override
  void dispose() {
    _emailController.dispose();
    _authController.dispose();
    super.dispose();
  }

  Future<void> _enviarEmail() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      await _authController.resetPassword(
        email: _emailController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "E-mail de recuperação enviado com sucesso!",
          ),
        ),
      );

      Navigator.pop(context);
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
          appBar: AppBar(
            title: const Text("Recuperar senha"),
            centerTitle: true,
          ),
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
                        title: "Esqueceu sua senha?",
                        subtitle:
                            "Informe seu e-mail para receber um link de recuperação.",
                      ),

                      const SizedBox(height: 40),

                      CustomTextField(
                        controller: _emailController,
                        label: "E-mail",
                        hint: "Digite seu e-mail",
                        prefixIcon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.email,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        onFieldSubmitted: (_) => _enviarEmail(),
                      ),

                      const SizedBox(height: 32),

                      CustomButton(
                        isLoading: _authController.isLoading,
                        onPressed: _authController.isLoading
                            ? null
                            : _enviarEmail,
                        child: const Text(
                          "Enviar link",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          "Voltar para o login",
                        ),
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