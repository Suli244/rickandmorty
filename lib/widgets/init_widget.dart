import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rikandmorty/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/cubits/change_theme_radio_cubit/change_theme_radio_cubit.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<ThemeProvider>(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<BottomNavigatorCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<ChangeThemeRadioCubit>(),
          ),
        ],
        child: child,
      ),
    );
  }
}
