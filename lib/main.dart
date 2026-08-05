import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'firebase_options.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // ignore: avoid_print
  print("Projeto: ${Firebase.app().options.projectId}");
  print("AppId: ${Firebase.app().options.appId}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quebra Galho',

      theme: AppTheme.lightTheme,

      initialRoute: AppRoutes.login,

      routes: AppPages.routes,
    );
  }
}