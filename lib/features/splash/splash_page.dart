import 'package:finances/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
        child: const Text('finances', style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        )
        ),
      ),
    );
  }
}