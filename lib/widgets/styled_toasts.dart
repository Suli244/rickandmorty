import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/main.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

void showErrorSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFF1100),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Builder(builder: (context) {
          return Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W400(
                color: context.watch<ThemeProvider>().text),
          );
        }),
      ),
    ),
  );
}

void showSuccessSnackBar(String text) {
  scaffoldKey.currentState?.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF026405),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Builder(builder: (context) {
          return Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.s16W400(
                color: context.watch<ThemeProvider>().text),
          );
        }),
      ),
    ),
  );
}
