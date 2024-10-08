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
import 'package:finances/features/signup/sign_up_controller.dart';
import 'package:finances/features/signup/sign_up_state.dart';
import 'package:finances/locator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context, builder: (context) => const CircularProgress());
      }
      if (_controller.state is SignUpSuccessState) {
        // Navigator.of(context).pushReplacementNamed('/home');
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.home);
      }
      if (_controller.state is SignUpErrorState) {
        final error = (_controller.state as SignUpErrorState);
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          button: 'Tentar novamente',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Economize Mais',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )),
          const Text('Gaste Menos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 36,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              )),
          Image.asset(
            'assets/images/register.png',
            height: 200,
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Seu Nome',
                  hintText: 'John Doe',
                  // inputFormatters: [UpperCaseTextInputFormatter(),],
                  validator: Validator.validateName,
                ),
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
                  helperText:
                      'A senha deve conter no mínimo 8 caracteres, contendo uma letra maiúscula e um número',
                ),
                PasswordFormField(
                  labelText: 'Confirme sua senha',
                  hintText: '********',
                  validator: (value) => Validator.validateConfirmPassword(
                      value, _passwordController.text),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Cadastrar',
                onPressed: () {
                  final valid = _formKey.currentState != null &&
                      (_formKey.currentState as FormState).validate();
                  if (valid) {
                    _controller.doSignUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    log('Invalido');
                  }
                },
              )),
          MultiTextButton(
              onPressed: () => Navigator.pushNamed(
                    context,
                    NamedRoutes.signIn,
                  ),
              children: const [
                Text('Já tem uma conta? ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkGray,
                    )),
                Text(
                  'Faça Login',
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
