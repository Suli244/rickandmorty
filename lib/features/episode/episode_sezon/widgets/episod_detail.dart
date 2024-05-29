import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/episode/data/models/episode_model.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.model});
  final ResultEpisodModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 343,
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/ac/64/a0/ac64a071e8c8b58bc8433c46bf6a86f1.jpg"),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'СЕРИЯ ${model.id.toString()}',
                    style: const TextStyle(
                      color: Color(0xDD22A2BD),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0.16,
                      letterSpacing: 1.50,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    model.name,
                    style: AppTextStyles.episodeName().copyWith(
                      fontSize: 13,
                      color: context.watch<ThemeProvider>().text,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    model.airDate,
                    style: const TextStyle(
                      color: Color(0x996E798C),
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                      letterSpacing: 0.25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
