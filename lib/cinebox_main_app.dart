import 'package:cinebox_app_flutter/ui/core/themes/themes.dart';
import 'package:cinebox_app_flutter/ui/home/home_screen.dart';
import 'package:cinebox_app_flutter/ui/login/login_screen.dart';
import 'package:cinebox_app_flutter/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineBox',
      theme: AppTheme.theme,
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
