import 'package:flutter/material.dart';
import 'package:rikandmorty/theme/app_text_styles.dart';

class divider extends StatelessWidget {
  const divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(94, 158, 158, 158),
      height: 20,
      thickness: 1,
    );
  }
}

class textGrey extends StatelessWidget {
  const textGrey({
    Key? key,
    required this.titel,
  }) : super(key: key);
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Text(
      titel,
      style: AppTextStyles.textAppearanceOverline(),
    );
  }
}
