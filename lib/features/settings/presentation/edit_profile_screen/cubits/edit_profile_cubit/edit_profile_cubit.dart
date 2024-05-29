import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/core/constants/shared_keys.dart';
import 'package:rikandmorty/core/functions/push_router_func.dart';
import 'package:rikandmorty/features/settings/data/models/profile_model.dart';
import 'package:rikandmorty/routes/mobile_auto_router.gr.dart';
import 'package:rikandmorty/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit({required this.prefs})
      : super(const EditProfileState.initial());

  final SharedPreferences prefs;
  final nameController = TextEditingController();
  final loginController = TextEditingController();

  Future<void> saveAllSetting(image) async {
    emit(const EditProfileState.loading());
    prefs.setString(SharedKeys.name, nameController.text);
    prefs.setString(SharedKeys.login, loginController.text);
    prefs.setString(SharedKeys.image, image);
    await Future.delayed(const Duration(seconds: 3));
    showSuccessSnackBar('Успешно Сохранено');
    pushAndPopUntilFunction(const BottomNavigatorRoute());
  }

  getDataFromScreen(ProfileModel model) {
    nameController.text = model.name;
    loginController.text = model.login;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    loginController.dispose();
    return super.close();
  }
}
