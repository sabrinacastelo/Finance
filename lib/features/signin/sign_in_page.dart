import 'dart:developer';
import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/constants/routes.dart';
import 'package:finances/common/utils/validator.dart';
import 'package:finances/common/widgets/circular_progress.dart';
import 'package:finances/common/widgets/custom_bottom_sheet.dart';
import 'package:finances/common/widgets/custom_text_field.dart';
import 'package:finances/common/widgets/multi_text_button.dart';
import 'package:finances/common/widgets/password_form_field.dart';
import 'package:finances/common/widgets/primary_button.dart';
import 'package:finances/features/signin/sign_in_controller.dart';
import 'package:finances/features/signin/sign_in_state.dart';
import 'package:finances/locator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
            context: context,
            builder: (context) =>
                const CircularProgress());
      }
      if (_controller.state is SignInStateSuccess) {
        // Navigator.of(context).pushReplacementNamed('/home');
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.homePage);
      }
      if (_controller.state is SignInStateError) {
        final error = (_controller.state as SignInStateError);
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          button: 'Tentar novamente',);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text('Bem Vindo de Volta',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )),
          Image.asset(
            'assets/images/login.png',
            height: 250,
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'E-mail',
                  hintText: 'johndoe@gmail.com',
                  validator: Validator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  labelText: 'Senha',
                  hintText: '********',
                  validator: Validator.validatePassword,
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Entrar',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      (_formKey.currentState as FormState).validate();
                  if (valid) {
                    _controller.doSignIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    log('Invalido');
                  }
                },
              )),
          MultiTextButton(onPressed: () => Navigator.popAndPushNamed(context, NamedRoutes.signUp), 
          children: const [
            Text('Não tem uma conta? ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.darkGray,
                )),
            Text(
              ' Crie Agora',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            )
          ]),
        ],
      ),
    );
  }
}
