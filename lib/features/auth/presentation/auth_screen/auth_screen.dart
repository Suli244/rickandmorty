import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/core/images/app_images.dart';
import 'package:rikandmorty/features/auth/presentation/auth_screen/cubits/register_cubit/register_cubit.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/widgets/app_unfocuser.dart';
import 'package:rikandmorty/widgets/custom_button.dart';
import 'package:rikandmorty/widgets/custom_text_fild_two.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: AppUnfocuser(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  AppImages.authScreen,
                  width: 290,
                ),
                const SizedBox(height: 20),
                Builder(
                  builder: (context) => CustomTextFildTwo(
                    controller: context.read<RegisterCubit>().nameController,
                    titles: 'Имя',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Builder(
                  builder: (context) => CustomTextFildTwo(
                    controller: context.read<RegisterCubit>().loginController,
                    titles: 'Логин',
                  ),
                ),
                const SizedBox(height: 30),
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return CustomButton(
                      isLoading: state.isLoading,
                      text: 'Регистрация',
                      color: Colors.red,
                      onPress: () {
                        context.read<RegisterCubit>().setName();
                      },
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
