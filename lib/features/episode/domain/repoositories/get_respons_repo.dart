
import 'package:rikandmorty/features/episode/data/models/episode_model.dart';

abstract class GetEpisodeRepo {
  Future<EpisodeModel> getEpisode({required String episodeName});
}
