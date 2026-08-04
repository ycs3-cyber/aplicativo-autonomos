import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/recuperar_senha_screen.dart';
import '../screens/home/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final Map<String, WidgetBuilder> routes = {
    AppRoutes.login: (_) => const LoginScreen(),

    AppRoutes.recuperarSenha: (_) =>
        const RecuperarSenhaScreen(),

    AppRoutes.home: (_) => const HomeScreen(),
  };
}