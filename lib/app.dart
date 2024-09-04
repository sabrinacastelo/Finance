import 'package:finances/common/constants/routes.dart';
import 'package:finances/features/group/group_page.dart';
import 'package:finances/features/home/home_page_view.dart';
import 'package:finances/features/profile/profile_page.dart';
import 'package:finances/features/signin/sign_in_page.dart';
import 'package:finances/features/signup/signup_page.dart';
import 'package:finances/features/onboarding/onboarding_page.dart';
import 'package:finances/features/splash/splash_page.dart';
import 'package:finances/features/stats/stats_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.home: (context) => const OnboardingPage(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.signUp: (context) => const SignUpPage(),
        NamedRoutes.signIn: (context) => const SignInPage(),
        NamedRoutes.homePage: (context) => const HomePageView(),
        NamedRoutes.groupPage: (context) => const GroupPage(),
        NamedRoutes.statsPage: (context) => const StatsPage(),
        NamedRoutes.profilePage: (context) => const ProfilePage(),
      },
    );
  }
}