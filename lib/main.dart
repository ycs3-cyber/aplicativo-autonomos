import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_autonomos/routes/app_pages.dart';
import 'package:projeto_autonomos/routes/app_routes.dart';

import 'package:projeto_autonomos/config/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quebra Galho',

      // Tema do aplicativo
      theme: AppTheme.lightTheme,

      // Primeira tela
      initialRoute: AppRoutes.login,

      // Rotas do aplicativo
      routes: AppPages.routes,
    );
  }
}