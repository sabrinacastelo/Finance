import 'dart:async';
import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/constants/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(
      const Duration(seconds: 2),
      navigateToOnboarding,
    );
  }

  void navigateToOnboarding() {
    Navigator.pushReplacementNamed(context, NamedRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.coldGradient,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('finances',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                )),
            // CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
