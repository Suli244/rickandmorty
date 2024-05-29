import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/features/settings/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rikandmorty/core/constants/shared_keys.dart';

part 'get_shar_pref_cubit.freezed.dart';
part 'get_shar_pref_state.dart';

class GetSharPrefCubit extends Cubit<GetSharPrefState> {
  GetSharPrefCubit(this.prefs) : super(const GetSharPrefState.initial()) {
    getSharPref();
  }
  final SharedPreferences prefs;

  getSharPref() {
    final name = prefs.getString(SharedKeys.name) ?? '';
    final login = prefs.getString(SharedKeys.login) ?? '';
    final image = prefs.getString(SharedKeys.image) ?? '';
    emit(
      GetSharPrefState.success(
        ProfileModel(
          name: name,
          login: login,
          image: image,
        ),
      ),
    );
  }
}
