import 'package:finances/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  
  const PrimaryButton({
    super.key, this.onPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.coldGradient,
        ),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(36)),
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36))
        ),
          width: 350,
          height: 64,
          alignment: Alignment.center,
          child: Text(text,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          )),
        ),
      ),
      ),
    );
  }
}
