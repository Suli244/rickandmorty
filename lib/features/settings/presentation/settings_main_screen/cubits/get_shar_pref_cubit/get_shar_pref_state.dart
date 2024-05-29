part of 'get_shar_pref_cubit.dart';

@freezed
class GetSharPrefState with _$GetSharPrefState {
  const factory GetSharPrefState.initial() = _Initial;
  const factory GetSharPrefState.success(ProfileModel profileModel) = _Success;
}
