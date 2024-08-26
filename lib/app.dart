// import 'package:finances/features/onboarding/onboarding_page.dart';
import 'package:finances/common/themes/default_theme.dart';
import 'package:finances/features/signup/signup_page.dart';
// import 'package:finances/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      home: const SignUpPage(),
    );
  }
}