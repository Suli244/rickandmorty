import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rikandmorty/core/images/app_svgs.dart';
import 'package:rikandmorty/features/settings/data/models/profile_model.dart';
import 'package:rikandmorty/features/settings/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/change_theme_radio_cubit/change_theme_radio_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/get_shar_pref_cubit/get_shar_pref_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/widgets/settings_divider.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/widgets/show_select_theme_dialog.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/custom_app_bar.dart';
import 'package:rikandmorty/widgets/custom_button.dart';

class SettingsMainScreen extends StatelessWidget {
  const SettingsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetSharPrefCubit>(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Настройки',
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GetSharPrefCubit, GetSharPrefState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const CircularProgressIndicator(),
                    success: (profileModel) => Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 42,
                              backgroundImage: FileImage(
                                File(
                                  profileModel.image,
                                ),
                              ),
                            ),
                            
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  profileModel.name,
                                  style: AppTextStyles.s17W600(
                                    color: context.watch<ThemeProvider>().text,
                                  ),
                                ),
                                Text(
                                  profileModel.login,
                                  style: AppTextStyles.s15W600(
                                      color: AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Редактировать',
                          textColor: AppColors.bottonNavigator,
                          color: context.watch<ThemeProvider>().screen,
                          colorBorder: AppColors.bottonNavigator,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(
                                  model: ProfileModel(
                                    name: profileModel.name,
                                    login: profileModel.login,
                                    image: profileModel.image,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              const divider(),
              const textGrey(
                titel: 'Внешний вид',
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () async {
                  await showSelectThemeDialog(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppSvg.theem,
                      color: context.watch<ThemeProvider>().text,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 40),
                          Text(
                            'Cветлый тема',
                            style: AppTextStyles.s17W600().copyWith(
                              color: context.watch<ThemeProvider>().text,
                            ),
                          ),
                          BlocBuilder<ChangeThemeRadioCubit,
                              ChangeThemeRadioState>(
                            builder: (context, state) {
                              return Text(
                                state.selectedRadio,
                                style: AppTextStyles.s16W500().copyWith(
                                  color: AppColors.grey,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: context.watch<ThemeProvider>().text,
                      size: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const divider(),
              const SizedBox(height: 20),
              const textGrey(titel: 'О приложении'),
              const SizedBox(height: 10),
              Text(
                'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                style: AppTextStyles.s16W500()
                    .copyWith(color: context.watch<ThemeProvider>().text),
              ),
              const SizedBox(height: 20),
              const divider(),
              const SizedBox(height: 10),
              const textGrey(titel: 'Версия приложения'),
              const SizedBox(height: 25),
              Text(
                'Rick & Morty  v1.0.0',
                style: AppTextStyles.s16W500()
                    .copyWith(color: context.watch<ThemeProvider>().text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
