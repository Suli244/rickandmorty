// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rikandmorty/features/person/presentation/person_filtr_screen/cubits/cubit/is_chekbool_cubit.dart';
import 'package:rikandmorty/features/person/presentation/person_filtr_screen/widget/filter_widget.dart';
import 'package:rikandmorty/features/settings/presentation/settings_main_screen/widgets/settings_divider.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/custom_button.dart';

class PersonFiltr extends StatelessWidget {
  const PersonFiltr({
    super.key,
    required this.status,
    required this.gender,
  });
  final String status;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<IsChekboolCubit>()
        ..getFilter(
          statusFrom: status,
          genderFrom: gender,
        ),
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
            'Фильтры',
            style: AppTextStyles.s18W700()
                .copyWith(color: context.watch<ThemeProvider>().text),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: BlocBuilder<IsChekboolCubit, IsChekboolState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const textGrey(titel: 'Статус'),
                  ChekboxWidget(
                    name: 'Живой',
                    value: state.status == 'alive',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(statusFrom: 'alive');
                    },
                  ),
                  ChekboxWidget(
                    name: 'Мертвый',
                    value: state.status == 'dead',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(statusFrom: 'dead');
                    },
                  ),
                  ChekboxWidget(
                    name: 'Неизвестно',
                    value: state.status == 'unknown',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(statusFrom: 'unknown');
                    },
                  ),
                  const divider(),
                  const SizedBox(height: 13),
                  const textGrey(titel: 'Пол'),
                  ChekboxWidget(
                    name: 'Мужской',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(genderFrom: 'male');
                    },
                    value: state.gender == 'male',
                  ),
                  ChekboxWidget(
                    name: 'Женский',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(genderFrom: 'female');
                    },
                    value: state.gender == 'female',
                  ),
                  ChekboxWidget(
                    name: 'Бесполый',
                    onTap: () {
                      context
                          .read<IsChekboolCubit>()
                          .getFilter(genderFrom: 'genderless');
                    },
                    value: state.gender == 'genderless',
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    color: Colors.red,
                    onPress: () {
                      Navigator.of(context).pop(
                        FilterModel(
                          status:
                              context.read<IsChekboolCubit>().selectedStatus,
                          gender:
                              context.read<IsChekboolCubit>().selectedGender,
                        ),
                      );
                    },
                    text: 'Поиск',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FilterModel {
  final String status;
  final String gender;
  FilterModel({
    required this.status,
    required this.gender,
  });

  @override
  String toString() => 'FilterModel(status: $status, gender: $gender)';
}
