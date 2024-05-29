import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/features/episode/data/models/episode_model.dart';
import 'package:rikandmorty/features/episode/domain/repoositories/get_respons_repo.dart';
import 'package:rikandmorty/server/catch_exception.dart';

part 'get_episode_state.dart';
part 'get_episode_cubit.freezed.dart';

class GetEpisodeCubit extends Cubit<GetEpisodeState> {
  GetEpisodeCubit({required this.repo})
      : super(const GetEpisodeState.loading()) {
    getEpisode();
  }

  final GetEpisodeRepo repo;
  String episodeName = '';

  Future<void> getEpisode({String? nameFrom}) async {
    if (nameFrom != null) {
      episodeName = nameFrom;
    }
    emit(const GetEpisodeState.loading());
    try {
      final result = await repo.getEpisode(episodeName: episodeName);
      emit(GetEpisodeState.success(
          result.copyWith(results: List.from(result.results))));
    } catch (e) {
        emit(GetEpisodeState.error(CatchException.convertException(e)));
    }
  }
}
