import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/settings/data/models/profile_model.dart';
import 'package:rikandmorty/features/settings/presentation/edit_profile_screen/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/edit_profile_screen/cubits/file_image_cubit/file_image_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/widgets/settings_divider.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/app_unfocuser.dart';
import 'package:rikandmorty/widgets/custom_button.dart';
import 'package:rikandmorty/widgets/custom_text_fild_two.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
    required this.model,
  });

  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<EditProfileCubit>()..getDataFromScreen(model),
        ),
        BlocProvider(
          create: (context) => sl<FileImageCubit>()..getImageFrom(model.image),
        ),
      ],
      child: AppUnfocuser(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 27,
                color: context.watch<ThemeProvider>().text,
              ),
            ),
            elevation: 0,
            title: Text(
              'Редактировать профиль',
              style: AppTextStyles.s18W700()
                  .copyWith(color: context.watch<ThemeProvider>().text),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<FileImageCubit, FileImageState>(
                  builder: (context, state) {
                    return Center(
                      child: context
                              .read<FileImageCubit>()
                              .image
                              .contains('https:')
                          ? CircleAvatar(
                              radius: 80,
                              backgroundImage: NetworkImage(
                                context.read<FileImageCubit>().image,
                              ),
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(
                                File(
                                  context.read<FileImageCubit>().image,
                                ),
                              ),
                            ),
                    );
                  },
                ),
                Center(
                  child: BlocBuilder<FileImageCubit, FileImageState>(
                    builder: (context, state) {
                      return TextButton(
                        onPressed: () {
                          context.read<FileImageCubit>().changeImage();
                        },
                        child: Text(
                          'Изменить фото',
                          style: AppTextStyles.s16W500(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                const textGrey(titel: 'ПРОФИЛЬ'),
                const SizedBox(height: 20),
                Text(
                  'Имя',
                  style: AppTextStyles.s17W600(
                      color: context.watch<ThemeProvider>().text),
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  return CustomTextFildTwo(
                    titles: 'Имя',
                    controller: context.read<EditProfileCubit>().nameController,
                  );
                }),
                const SizedBox(height: 20),
                Text(
                  'Логин',
                  style: AppTextStyles.s17W600(
                    color: context.watch<ThemeProvider>().text,
                  ),
                ),
                const SizedBox(height: 10),
                Builder(builder: (context) {
                  return CustomTextFildTwo(
                    titles: 'Логин',
                    controller:
                        context.read<EditProfileCubit>().loginController,
                  );
                }),
                const SizedBox(height: 35),
                BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      color: const Color(0xFF22A2BD),
                      onPress: () {
                        context.read<EditProfileCubit>().saveAllSetting(
                              context.read<FileImageCubit>().image,
                            );
                      },
                      text: 'Сохранить',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
