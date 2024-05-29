// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/custom_text_fields.dart';

class CustomTextFildTwo extends StatelessWidget {
  const CustomTextFildTwo({
    Key? key,
    this.controller,
    this.isIconButtonfiltr = false,
    this.isIconPrefix = false,
    this.titles,
    this.onPressed,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isIconButtonfiltr;
  final bool isIconPrefix;
  final String? titles;
  final dynamic Function(String)? onChanged;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
        controller: controller,
        textStyleSerch: AppTextStyles.s16W500()
            .copyWith(color: context.watch<ThemeProvider>().textFildColorText),
        fillColor: context.watch<ThemeProvider>().textFildColorBeg,
        isFillColor: true,
        prefixColor: AppColors.additionalText,
        suffixColor: AppColors.additionalText,
        prefixIcon: isIconPrefix ? const Icon(Icons.search) : null,
        suffixIcon: isIconButtonfiltr
            ? IconButton(
                onPressed: isIconButtonfiltr ? onPressed : null,
                icon: const Icon(Icons.filter_alt_rounded))
            : null,
        hintText: titles,
        hintStyle: AppTextStyles.textAppearanceCaption().copyWith(fontSize: 16),
        onChanged: onChanged);
  }
}
