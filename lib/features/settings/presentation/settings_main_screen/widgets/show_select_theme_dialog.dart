import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/change_theme_radio_cubit/change_theme_radio_cubit.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

Future<void> showSelectThemeDialog(BuildContext mainContext) async {
  List<String> options = [
    'Включенна',
    'Выключенна',
  ];

  await showDialog(
    context: mainContext,
    builder: (context) =>
        BlocBuilder<ChangeThemeRadioCubit, ChangeThemeRadioState>(
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: context.watch<ThemeProvider>().screen,
          title: Text(
            'Cветлый тема',
            style: AppTextStyles.s17W600(
                color: context.watch<ThemeProvider>().text),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  'Включенна',
                  style: AppTextStyles.s17W600(
                      color: context.watch<ThemeProvider>().text),
                ),
                leading: Radio(
                  value: options[0],
                  groupValue: state.selectedRadio,
                  onChanged: (value) {
                    if (value != null) {
                      mainContext
                          .read<ChangeThemeRadioCubit>()
                          .getSelectedRadio(value);
                    }
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.changeTheme();
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Выключенна',
                  style: AppTextStyles.s17W600(
                      color: context.watch<ThemeProvider>().text),
                ),
                leading: Radio(
                  value: options[1],
                  groupValue: state.selectedRadio,
                  onChanged: (value) {
                    if (value != null) {
                      mainContext
                          .read<ChangeThemeRadioCubit>()
                          .getSelectedRadio(value);
                    }
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.changeTheme();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
