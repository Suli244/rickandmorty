import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikandmorty/theme/theme_provider.dart';

class PersonModelWidget extends StatelessWidget {
  const PersonModelWidget(
      {super.key, required this.title, required this.subtaitle});
  final String? title;
  final String? subtaitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            color: Color(0xFF5B6975),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.11,
            letterSpacing: 0.50,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          subtaitle ?? '',
          style: TextStyle(
            color: context.watch<ThemeProvider>().text,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0.10,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
