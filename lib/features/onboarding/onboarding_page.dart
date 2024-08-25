// import 'package:finances/app.dart';
import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(height: 50),
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.white,
              child: Image.asset('assets/images/card-money.png'),
            ),
          ),
          const Text('Economize Mais',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )),
              const Text('Gaste Menos',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )),
              // const SizedBox(
              //   height: 16,
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PrimaryButton(
                  text: 'Começar Agora', onPressed: () {
                }),
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              const Text('Já tem uma conta? Faça login',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGray,
              )),
              const SizedBox(
                height: 25,
              )
        ],
      ),
    );
  }
}

