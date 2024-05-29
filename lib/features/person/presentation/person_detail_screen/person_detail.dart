import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/features/person/presentation/person_detail_screen/widget/person_model_widget.dart';
import 'package:rikandmorty/theme/app_colors.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';
import 'package:rikandmorty/theme/theme_provider.dart';
import 'package:rikandmorty/widgets/spaces.dart';

class PersonDetail extends StatelessWidget {
  const PersonDetail({super.key, required this.model});

  final ResultPersonModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      model.image,
                      fit: BoxFit.cover,
                      width: getWidth(context),
                      height: 218,
                    ),
                    Container(
                      width: getWidth(context),
                      height: 218,
                      color: Colors.black.withOpacity(0.65),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 15),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: context.watch<ThemeProvider>().text,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 121),
                Text(
                  model.name,
                  style: AppTextStyles.personDitalNameTextStyle().copyWith(
                    color: context.watch<ThemeProvider>().text,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  model.status,
                  style: AppTextStyles.personDitalGenderTextStyle().copyWith(
                    color: model.status == 'Alive'
                        ? AppColors.green
                        : AppColors.red,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  model.name,
                  style: AppTextStyles.personDitalRasTextStyle(),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    PersonModelWidget(subtaitle: model.gender, title: 'Пол'),
                    const Spacer(),
                    PersonModelWidget(subtaitle: model.species, title: 'Расса'),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            PersonModelWidget(
                                title: 'Место рождения',
                                subtaitle: model.origin.name)
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: context.watch<ThemeProvider>().text,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            PersonModelWidget(
                                title: 'Местоположение',
                                subtaitle: model.location.name)
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: context.watch<ThemeProvider>().text,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  height: 5,
                  thickness: 2,
                  color: Color.fromARGB(94, 158, 158, 158),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Эпизоды',
                        style: TextStyle(
                          color: context.watch<ThemeProvider>().text,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0.07,
                          letterSpacing: 0.15,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Все эпизоды',
                        style: TextStyle(
                          color: Color(0xFF5B6975),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                          letterSpacing: 0.50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 143,
              left: getWidth(context) / 2 - 77,
              child: CircleAvatar(
                radius: 83,
                backgroundColor: context.watch<ThemeProvider>().screen,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: NetworkImage(model.image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
