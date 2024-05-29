import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rikandmorty/core/images/app_svgs.dart';
import 'package:rikandmorty/features/person/presentation/person_detail_screen/person_detail.dart';
import 'package:rikandmorty/features/person/presentation/person_filtr_screen/person_filtr.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/cubits/get_person_cubit/get_person_cubit.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/cubits/is_list_grid_cubit/is_list_grid_cubit.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/widgets/person_gridview_widget.dart';
import 'package:rikandmorty/features/person/presentation/person_main_screen/widgets/person_itam_widget.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/widgets/app_error_text.dart';
import 'package:rikandmorty/widgets/app_indicator.dart';
import 'package:rikandmorty/widgets/app_unfocuser.dart';
import 'package:rikandmorty/widgets/custom_text_fild_two.dart';

class PersonMainScreen extends StatelessWidget {
  const PersonMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GetPersonCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<IsListGridCubit>(),
        ),
      ],
      child: AppUnfocuser(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                children: [
                  Builder(
                    builder: (context) => CustomTextFildTwo(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PersonFiltr(
                              gender:
                                  context.read<GetPersonCubit>().selectedGender,
                              status:
                                  context.read<GetPersonCubit>().selectedStatus,
                            ),
                          ),
                        ) as FilterModel?;

                        if (result != null) {
                          if (context.mounted) {
                            context.read<GetPersonCubit>().getPerson(
                                  statusFrom: result.status,
                                  genderFrom: result.gender,
                                );
                          }
                        }
                      },
                      isIconPrefix: true,
                      isIconButtonfiltr: true,
                      titles: 'Найти персонажа',
                      onChanged: (value) {
                        context
                            .read<GetPersonCubit>()
                            .getPerson(nameFrom: value);
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<GetPersonCubit, GetPersonState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () => const AppIndicator(),
                          error: (error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppErrorText(error: error.message),
                              const Spacer(),
                            ],
                          ),
                          success: (model) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Text(
                                    'Всего пресонажей: ${model.info.count}',
                                    style:
                                        AppTextStyles.textAppearanceCaption(),
                                  ),
                                  const Spacer(),
                                  BlocBuilder<IsListGridCubit, IsListGridState>(
                                    builder: (context, state) {
                                      return IconButton(
                                        onPressed: () {
                                          context
                                              .read<IsListGridCubit>()
                                              .isGridList(state.isGrid);
                                        },
                                        icon: SvgPicture.asset(
                                          state.isGrid
                                              ? AppSvg.list
                                              : AppSvg.grid,
                                          width: 26,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 13),
                              Expanded(
                                child: BlocBuilder<IsListGridCubit,
                                    IsListGridState>(
                                  builder: (context, state) {
                                    return state.isGrid
                                        ? GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.8,
                                            ),
                                            itemBuilder: (context, index) =>
                                                PersonVidgetWidget(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PersonDetail(
                                                      model:
                                                          model.results[index],
                                                    ),
                                                  ),
                                                );
                                              },
                                              model: model.results[index],
                                              index: index,
                                            ),
                                            itemCount: model.results.length,
                                          )
                                        : ListView.separated(
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(height: 16),
                                            controller: context
                                                .read<GetPersonCubit>()
                                                .scrollController,
                                            itemCount: model.results.length,
                                            itemBuilder: (context, index) =>
                                                PersonItamWidget(
                                              model: model.results[index],
                                            ),
                                          );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
