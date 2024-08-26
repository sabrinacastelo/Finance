import 'package:finances/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  ),
));
