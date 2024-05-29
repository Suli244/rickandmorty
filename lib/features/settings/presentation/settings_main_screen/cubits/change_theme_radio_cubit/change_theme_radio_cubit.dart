import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_theme_radio_state.dart';
part 'change_theme_radio_cubit.freezed.dart';

class ChangeThemeRadioCubit extends Cubit<ChangeThemeRadioState> {
  ChangeThemeRadioCubit()
      : super(const ChangeThemeRadioState.initial('Выключенна'));

  getSelectedRadio(String radio) {
    emit(ChangeThemeRadioState.initial(radio));
  }
}
