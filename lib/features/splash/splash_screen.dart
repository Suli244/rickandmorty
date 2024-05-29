import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/core/images/app_images.dart';
import 'package:rikandmorty/features/splash/splash_cubit/splash_cubit.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/widgets/spaces.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<SplashCubit>(
        create: (context) => sl<SplashCubit>(),
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            return Center(
              child: Image.asset(
                AppImages.splashScreen,
                fit: BoxFit.fill,
                width: getWidth(context),
                height: getHeight(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
