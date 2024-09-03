// import 'package:finances/common/themes/default_theme.dart';
import 'package:finances/common/constants/routes.dart';
import 'package:finances/features/home/home_page.dart';
import 'package:finances/features/signin/sign_in_page.dart';
import 'package:finances/features/signup/signup_page.dart';
import 'package:finances/features/onboarding/onboarding_page.dart';
import 'package:finances/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: defaultTheme,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.home: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
        NamedRoutes.homePage: (context) => const HomaPage(),
      },
    );
  }
}