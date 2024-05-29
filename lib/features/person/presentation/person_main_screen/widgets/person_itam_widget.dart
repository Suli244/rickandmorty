import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/features/person/presentation/person_detail_screen/person_detail.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class PersonItamWidget extends StatelessWidget {
  const PersonItamWidget({
    super.key,
    required this.model,
  });
  final ResultPersonModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonDetail(
                model: model,
              ),
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 37,
              backgroundImage: CachedNetworkImageProvider(
                model.image,
              ),
            ),
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.status,
                  style: AppTextStyles.textAppearanceOverline(
                    color: model.status == 'Alive'
                        ? AppColors.green
                        : AppColors.red,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  model.name,
                  style: AppTextStyles.robotoName(
                    color: context.watch<ThemeProvider>().text,
                  ),
                ),
                const SizedBox(height: 3),
                Text(model.gender,
                    style: AppTextStyles.textAppearanceCaption()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
