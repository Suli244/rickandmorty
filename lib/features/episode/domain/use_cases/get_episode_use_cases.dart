import 'package:rikandmorty/features/episode/data/models/episode_model.dart';
import 'package:rikandmorty/features/episode/domain/repoositories/get_respons_repo.dart';
 
class GetEpisodeUseCase {
  GetEpisodeUseCase({required this.repo});
  final GetEpisodeRepo repo;

 List<ResultEpisodModel> episodList = [];

  Future<EpisodeModel> getEpisode({required String episodeName}) async {
    try {
      final result = await repo.getEpisode(
        episodeName: episodeName,
      );
      episodList.addAll(result.results);
      return result.copyWith(results: episodList);
    } catch (e) {
      rethrow; 
    }
  }
}
