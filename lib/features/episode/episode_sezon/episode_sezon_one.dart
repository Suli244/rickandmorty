import 'package:flutter/material.dart';
import 'package:rikandmorty/features/episode/data/models/episode_model.dart';
import 'package:rikandmorty/features/episode/episode_sezon/widgets/episod_detail.dart';

class EpisodeSezonOne extends StatelessWidget {
  const EpisodeSezonOne({super.key, required this.model});
  final EpisodeModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Episode(
                model: model.results[index],
              ),
              itemCount: model.results.length,
            ),
          ),
        ],
      ),
    );
  }
}