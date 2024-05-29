import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class ChekboxWidget extends StatelessWidget {
  const ChekboxWidget({
    Key? key,
    required this.name,
    required this.onTap,
    required this.value,
  }) : super(key: key);

  final String name;
  final Function()? onTap;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Checkbox(
              value: value,
              activeColor: AppColors.blue,
              side: const BorderSide(color: AppColors.grey),
              onChanged: null,
            ),
            Text(
              name,
              style: AppTextStyles.s16W500().copyWith(
                color: context.watch<ThemeProvider>().text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
