import 'package:finances/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText; 
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
    const CustomTextFormField({
    super.key,  this.padding, this.hintText, this.labelText, this.textCapitalization, this.controller, this.keyboardType, this.maxLength, this.suffixIcon, this.obscureText, this.inputFormatters, this.validator,
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
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        style: const TextStyle(color: AppColors.primaryColor),
        obscureText: widget.obscureText ?? false,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon != null 
              ? IconTheme(
                  data: const IconThemeData(color: AppColors.primaryColor),
                  child: widget.suffixIcon!,
                )
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: widget.labelText,
          focusedBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: AppColors.primaryColor)),
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
