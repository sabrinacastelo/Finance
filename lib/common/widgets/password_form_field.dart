import 'dart:developer';

import 'package:finances/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const PasswordFormField({super.key, this.controller, this.padding, this.hintText, this.labelText, this.validator, this.helperText});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding as EdgeInsets?,
      hintText: widget.hintText,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off), 
        onTap: () {
        log("pressed");
        setState(() {
          isHidden = !isHidden;
        });
      }
      ),
    );
  }
}