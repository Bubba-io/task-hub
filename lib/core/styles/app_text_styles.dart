import 'package:flutter/material.dart';
import 'package:task_hub/core/styles/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get h1 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: AppColors.black,
      );

  static TextStyle get h2 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: AppColors.black,
      );

  static TextStyle get h3 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );

  static TextStyle get h4 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.black,
      );

  static TextStyle get h5 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );

  static TextStyle get h6 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColors.black,
      );

  static TextStyle get subtitle1 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: AppColors.black,
      );

  static TextStyle get subtitle2 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: AppColors.black,
      );

  static TextStyle get body1 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: AppColors.black,
      );

  static TextStyle get body2 => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: AppColors.black,
      );

  static TextStyle get button => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: AppColors.black,
      );

  static TextStyle get caption => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: AppColors.black,
      );

  static TextStyle get overline => const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: AppColors.black,
      );
}
