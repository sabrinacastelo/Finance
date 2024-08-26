import 'dart:developer';

import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/widgets/custom_text_field.dart';
import 'package:finances/common/widgets/multi_text_button.dart';
import 'package:finances/common/widgets/password_form_field.dart';
import 'package:finances/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey();

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
                  labelText: 'Seu Nome',
                  hintText: 'JOHN DOE',
                  // inputFormatters: [UpperCaseTextInputFormatter(),],
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, preencha o campo com seu nome';
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  labelText: 'E-mail',
                  hintText: 'johndoe@gmail.com',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, preencha o campo com seu nome';
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  labelText: 'Senha',
                  hintText: '********',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, preencha o campo com seu nome';
                    }
                    return null;
                  },
                ),
                PasswordFormField(
                  labelText: 'Confirme sua senha',
                  hintText: '********',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Por favor, preencha o campo com seu nome';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                text: 'Cadastrar',
                onPressed: () {
                final valid = _formKey.currentState != null && (_formKey.currentState as FormState).validate();
                 if(valid){
                    log('Valido');
                 }else{
                    log('Invalido');
                 }
                },
              )),
          const MultiTextButton(onPressed: null, children: [
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
