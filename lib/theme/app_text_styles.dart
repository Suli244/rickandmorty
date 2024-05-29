import 'package:flutter/material.dart';
import 'package:rikandmorty/theme/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle s14W400({Color? color}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W400({Color? color}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W600({Color? color}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );
  static TextStyle s16W400({Color? color}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s16W500({Color? color}) => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s18W700({Color? color}) => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color ?? Colors.black,
      );
  static TextStyle s17W600({Color? color}) => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: color ?? AppColors.black,
      );

  static TextStyle s24W900({Color? color}) => TextStyle(
        fontSize: 24,
        color: color ?? AppColors.color423939,
        fontWeight: FontWeight.w900,
      );
  static TextStyle s24W700({Color? color}) => TextStyle(
        fontSize: 24,
        color: color ?? AppColors.black,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s20W700({Color? color}) => TextStyle(
        fontSize: 20,
        color: color ?? AppColors.white,
        fontWeight: FontWeight.w700,
      );
  static TextStyle s28W900({Color? color}) => TextStyle(
        fontSize: 28,
        color: color ?? AppColors.color423939,
        fontWeight: FontWeight.w900,
      );
  static TextStyle s60W900({Color? color}) => TextStyle(
        fontSize: 60,
        color: color ?? AppColors.color423939,
        fontWeight: FontWeight.w900,
      );
  static TextStyle textAppearanceBody1({Color? color}) => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? AppColors.color423939,
      );
  static TextStyle roboto({Color? color}) => TextStyle(
        fontSize: 16,
        letterSpacing: 1.50,
        fontWeight: FontWeight.w700,
        color: color ?? AppColors.color423939,
      );
  static TextStyle textAppearanceOverline({Color? color}) => TextStyle(
        fontSize: 13,
        height: 1.50,
        letterSpacing: 0.50,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.textAppearanceOverline,
      );
  static TextStyle robotoName({Color? color}) => TextStyle(
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 1.50,
        letterSpacing: 0.50,
        color: color ?? AppColors.color423939,
      );
  static TextStyle textAppearanceCaption({Color? color}) => TextStyle(
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.50,
        color: color ?? AppColors.additionalText,
      );
  static TextStyle personDitalNameTextStyle({Color? color}) => const TextStyle(
        color: Colors.white,
        fontSize: 34,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.03,
        letterSpacing: 0.25,
      );
  static TextStyle personDitalGenderTextStyle({Color? color}) =>
      const TextStyle(
        color: Color(0xFF42D048),
        fontSize: 15,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 0.16,
        letterSpacing: 1.50,
      );
  static TextStyle personDitalRasTextStyle({Color? color}) => const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.12,
        letterSpacing: 0.50,
      );
  static TextStyle episodeName({Color? color}) => const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        height: 0.09,
        letterSpacing: 0.50,
      );
  static TextStyle profilName({Color? color}) => const TextStyle(
        color: Color(0x996E798C),
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.10,
        letterSpacing: 0.25,
      );
  static TextStyle profilNameE({Color? color}) => TextStyle(
        color: Colors.white.withOpacity(0.8700000047683716),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.09,
        letterSpacing: 0.15,
      );
}
