import 'package:finances/common/constants/app_colors.dart';
import 'package:finances/common/widgets/multi_text_button.dart';
import 'package:finances/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
          Image.asset('assets/images/register.png',
          height: 200,),
          const SizedBox(height: 20),
          const Form(child: Column(
            children: [
              CustomTextFormField(
                labelText:'Seu Nome',
                hintText: 'Victoria Cardoso',
              ),
            ],
          ),),
           Padding(
              padding: const EdgeInsets.all(16.0),
               child: PrimaryButton( 
                text: 'Cadastrar',
                onPressed: () {},
              )
          ),
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

class CustomTextFormField extends StatefulWidget {
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText; 
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
    const CustomTextFormField({
    super.key,  this.padding, this.hintText, this.labelText, this.textCapitalization, this.controller, this.keyboardType, this.maxLength,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder();
  final BorderSide borderSide = const BorderSide(color: AppColors.primaryColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(12.0),
      child: TextFormField(
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(borderSide: const BorderSide(
            color: Colors.red,)),
          focusedErrorBorder: defaultBorder.copyWith(borderSide: const BorderSide(
            color: Colors.red,
          )),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
