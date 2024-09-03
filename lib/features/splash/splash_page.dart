import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/constants/routes.dart';
import 'package:finances/features/splash/splash_controller.dart';
import 'package:finances/features/splash/splash_state.dart';
import 'package:finances/locator.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener((){

      if(_splashController.state is SuccessSplashState){
        Navigator.pushReplacementNamed(context, NamedRoutes.homePage);
      } else if(_splashController.state is ErrorSplashState){
        Navigator.pushReplacementNamed(context, NamedRoutes.home);
      }
    });
  }

@override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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
