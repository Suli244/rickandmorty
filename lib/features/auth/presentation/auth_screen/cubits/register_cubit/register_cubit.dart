import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/core/constants/shared_keys.dart';
import 'package:rikandmorty/core/functions/push_router_func.dart';
import 'package:rikandmorty/routes/mobile_auto_router.gr.dart';
import 'package:rikandmorty/widgets/styled_toasts.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.prefs}) : super(const RegisterState.initial());
  final SharedPreferences prefs;
  final nameController = TextEditingController();
  final loginController = TextEditingController();

  Future<void> setName() async {
    emit(const RegisterState.loading());
    prefs.setString(SharedKeys.name, nameController.text);
    prefs.setString(SharedKeys.login, loginController.text);
    await Future.delayed(const Duration(seconds: 3));
     showSuccessSnackBar('Успешно зарегистрирован');
     pushAndPopUntilFunction(const BottomNavigatorRoute());
  }
}