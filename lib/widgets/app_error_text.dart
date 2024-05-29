import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/spaces.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/widgets/custom_button.dart';

class AppErrorText extends StatelessWidget {
  const AppErrorText({
    required this.error,
    this.onPress,
    Key? key,
  }) : super(key: key);
  final String error;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: getWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Результаты поиска',
              style: AppTextStyles.textAppearanceCaption(),
            ),
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                'assets/images/errorPerson.png',
                fit: BoxFit.fill,
                width: 200,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                error,
                style: AppTextStyles.s18W700(
                  color: context.watch<ThemeProvider>().text,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            onPress != null
                ? CustomButton(
                    width: null,
                    text: 'Повторить запрос',
                    color: AppColors.color65C130,
                    onPress: onPress!,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
