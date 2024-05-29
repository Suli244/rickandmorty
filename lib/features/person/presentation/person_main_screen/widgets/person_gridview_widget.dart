// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class PersonVidgetWidget extends StatelessWidget {
  const PersonVidgetWidget({
    Key? key,
    required this.model,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final ResultPersonModel model;
  final int index;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 63,
            backgroundImage: NetworkImage(
              model.image,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Text(
                model.status,
                style: AppTextStyles.textAppearanceOverline().copyWith(
                  color:
                      model.status == 'Alive' ? AppColors.green : AppColors.red,
                ),
              ),
              Text(
                model.name,
                style: AppTextStyles.robotoName(
                    color: context.watch<ThemeProvider>().text),
                textAlign: TextAlign.center,
              ),
              Text(model.gender, style: AppTextStyles.textAppearanceCaption()),
            ],
          ),
        ],
      ),
    );
  }
}
