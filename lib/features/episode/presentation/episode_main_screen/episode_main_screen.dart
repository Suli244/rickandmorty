import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/episode/episode_sezon/episode_sezon_five.dart';
import 'package:rikandmorty/features/episode/episode_sezon/episode_sezon_four.dart';
import 'package:rikandmorty/features/episode/episode_sezon/episode_sezon_one.dart';
import 'package:rikandmorty/features/episode/episode_sezon/episode_sezon_three.dart';
import 'package:rikandmorty/features/episode/episode_sezon/episode_sezon_two.dart';
import 'package:rikandmorty/features/episode/presentation/episode_main_screen/cubits/cubit/get_episode_cubit.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/app_error_text.dart';
import 'package:rikandmorty/widgets/app_indicator.dart';
import 'package:rikandmorty/widgets/app_unfocuser.dart';
import 'package:rikandmorty/widgets/custom_text_fild_two.dart';

class EpisodeMainScreen extends StatelessWidget {
  const EpisodeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocProvider(
        create: (context) => sl<GetEpisodeCubit>(),
        child: AppUnfocuser(
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      return CustomTextFildTwo(
                        titles: 'Найти эпизод',
                        onChanged: (value) {
                          context
                              .read<GetEpisodeCubit>()
                              .getEpisode(nameFrom: value);
                        },
                        isIconPrefix: true,
                      );
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    TabBar(
                        labelColor: context.watch<ThemeProvider>().text,
                        indicatorColor: context.watch<ThemeProvider>().text,
                        unselectedLabelColor: AppColors.additionalText,
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            text: 'СЕЗОН 1',
                          ),
                          Tab(
                            text: 'СЕЗОН 2',
                          ),
                          Tab(
                            text: 'СЕЗОН 3',
                          ),
                          Tab(
                            text: 'СЕЗОН 4',
                          ),
                          Tab(
                            text: 'СЕЗОН 5',
                          ),
                        ]),
                    BlocBuilder<GetEpisodeCubit, GetEpisodeState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => const AppIndicator(),
                          error: (error) => AppErrorText(error: error.message),
                          success: (model) => Expanded(
                            child: TabBarView(
                              children: [
                                EpisodeSezonOne(model: model),
                                EpisodeSezonTwo(model: model),
                                EpisodeSezonThree(model: model),
                                EpisodeSezonFour(model: model),
                                EpisodeSezonFive(model: model),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
