import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rikandmorty/core/images/app_svgs.dart';
import 'package:rikandmorty/features/bottom_navigator/presentation/bottom_navigator_cubit/bottom_navigator_cubit.dart';
import 'package:rikandmorty/features/episode/presentation/episode_main_screen/episode_main_screen.dart';
import 'package:rikandmorty/features/loaction/presentation/location_main_screen/location_main_screen.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/person_main_screen.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/settings_main_screen.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

@RoutePage()
class BottomNavigatorScreen extends StatelessWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigatorCubit, BottomNavigatorState>(
      builder: (context, state) {
        return Scaffold(
          body: pages[state.index],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 2,
            backgroundColor: context.watch<ThemeProvider>().screen,
            type: BottomNavigationBarType.fixed,
            selectedItemColor:
                context.watch<ThemeProvider>().textButtonNavigator,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            unselectedItemColor: const Color.fromARGB(207, 110, 121, 140),
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomNavigatorCubit>().getCurrentPage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvg.person,
                  color: const Color.fromARGB(167, 110, 121, 140),
                ),
                activeIcon: SvgPicture.asset(
                  AppSvg.person,
                  color: context.watch<ThemeProvider>().textButtonNavigator,
                ),
                label: 'Персонажи',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvg.loaction,
                  color: const Color.fromARGB(167, 110, 121, 140),
                ),
                activeIcon: SvgPicture.asset(
                  AppSvg.loaction,
                  color: context.watch<ThemeProvider>().textButtonNavigator,
                ),
                label: 'Локации',
              ),


              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvg.episode,
                  color: const Color.fromARGB(167, 110, 121, 140),
                ),
                activeIcon: SvgPicture.asset(
                  AppSvg.episode,
                  color: context.watch<ThemeProvider>().textButtonNavigator,
                ),
                label: 'Эпизоды',
              ),


              
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppSvg.settings,
                  color: const Color.fromARGB(167, 110, 121, 140),
                ),
                activeIcon: SvgPicture.asset(
                  AppSvg.settings,
                  color: context.watch<ThemeProvider>().textButtonNavigator,
                ),
                label: 'Настройки',
              ),
            ],
          ),
        );
      },
    );
  }
}

List<Widget> pages = [
  const PersonMainScreen(),
  const LocationMainScreen(),
  const EpisodeMainScreen(),
  const SettingsMainScreen(),
];
