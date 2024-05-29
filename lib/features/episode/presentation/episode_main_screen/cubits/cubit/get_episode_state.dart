part of 'get_episode_cubit.dart';

@freezed
class GetEpisodeState with _$GetEpisodeState {
  const factory GetEpisodeState.loading() = _Loading;
  const factory GetEpisodeState.error(CatchException error) = _Error;
  const factory GetEpisodeState.success(EpisodeModel model) = _Success;
}
