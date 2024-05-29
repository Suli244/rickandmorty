import 'package:dio/dio.dart';
import 'package:rikandmorty/features/episode/data/models/episode_model.dart';
import 'package:rikandmorty/features/episode/domain/repoositories/get_respons_repo.dart';
import 'package:rikandmorty/server/catch_exception.dart';

class GetEpisodeRepoImpl implements GetEpisodeRepo {
  GetEpisodeRepoImpl({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<EpisodeModel> getEpisode({required String episodeName}) async {
    try {
      final response =
          await dio.get('episode', queryParameters: {'name': episodeName});

      return EpisodeModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
