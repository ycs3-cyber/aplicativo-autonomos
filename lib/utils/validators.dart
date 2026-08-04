class Validators {
  Validators._();

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Informe seu e-mail";
    }

    final regex = RegExp(
      r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$',
    );

    if (!regex.hasMatch(value.trim())) {
      return "E-mail inválido";
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Informe sua senha";
    }

    if (value.length < 6) {
      return "A senha deve possuir pelo menos 6 caracteres.";
    }

    return null;
  }

  static String? requiredField(
    String? value, {
    String fieldName = "Campo",
  }) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName é obrigatório.";
    }

    return null;
  }

  static String? confirmPassword(
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return "Confirme sua senha.";
    }

    if (value != password) {
      return "As senhas não coincidem.";
    }

    return null;
  }
}