part of 'get_person_cubit.dart';

@freezed
class GetPersonState with _$GetPersonState {
  const factory GetPersonState.loading() = _Loading;
  const factory GetPersonState.error(CatchException error) = _Error;
  const factory GetPersonState.success(PersonModel model) = _Success;
}
