import 'dart:developer';
import 'package:finances/features/onboarding/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/extensions/sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo com gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.coldGradient,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(600, 50),
                bottomRight: Radius.elliptical(600, 50),
              ),
            ),
            height: 450.h, // Aumentado para preencher ainda mais da tela
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 64.h), // Aumentado ainda mais para uma tela maior
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
              children: [
                CircleAvatar(
                  radius: 100.w, // Aumentado significativamente para uma tela maior
                  backgroundImage: const AssetImage('assets/images/card-money.png'),
                ),
                SizedBox(height: 32.h), // Aumentado para mais espaçamento
                const Text(
                  'Hejix',
                  style: TextStyle(
                    fontSize: 32.0, // Aumentado para uma tela maior
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 16), // Aumentado para mais espaçamento
                const Text(
                  'nihejix546@esterace.com',
                  style: TextStyle(
                    fontSize: 20.0, // Aumentado para uma tela maior
                    color: AppColors.white,
                  ),
                ),
                const Spacer(), // Mantém o espaçamento flexível abaixo dos elementos
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      log('Usuário deslogado com sucesso');
                      // Navegar para a tela de login
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const OnboardingPage()),
                      );
                    } catch (e) {
                      log('Erro ao deslogar: $e');
                      // Exibir uma mensagem de erro, se necessário
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Erro ao sair da conta. Tente novamente.')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 48.w), // Aumentado para botões maiores
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Sair',
                    style: TextStyle(
                      fontSize: 20.0, // Aumentado para uma tela maior
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 235, 78, 78),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
