import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/loaction/presentation/location_main_screen/cubits/cubit/get_loactions_cubit.dart';
import 'package:rikandmorty/features/loaction/presentation/location_main_screen/widgets/location_detail.dart';
import 'package:rikandmorty/server/service_locator.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/widgets/app_error_text.dart';
import 'package:rikandmorty/widgets/app_indicator.dart';
import 'package:rikandmorty/widgets/app_unfocuser.dart';
import 'package:rikandmorty/widgets/custom_text_fild_two.dart';

class LocationMainScreen extends StatelessWidget {
  const LocationMainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetLoactionsCubit>(),
      child: AppUnfocuser(
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      return CustomTextFildTwo(
                        titles: 'Найти локацию',
                        onChanged: (value) {
                          context
                              .read<GetLoactionsCubit>()
                              .getLoaction(nameFrom: value);
                        },
                        isIconPrefix: true,
                      );
                    },
                  ),
                  Expanded(
                    child: BlocBuilder<GetLoactionsCubit, GetLoactionsState>(
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
                              const SizedBox(height: 20),
                              Text(
                                'Всего локаций: ${model.info.count}',
                                style: AppTextStyles.textAppearanceCaption(),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      LocationDetali(
                                    onTap: () {},
                                    madel: model.results[index],
                                  ),
                                  itemCount: model.results.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
