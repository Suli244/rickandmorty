import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'is_chekbool_state.dart';
part 'is_chekbool_cubit.freezed.dart';

class IsChekboolCubit extends Cubit<IsChekboolState> {
  IsChekboolCubit() : super(const IsChekboolState.initial('', ''));

  String status = '';
  String gender = '';

  String get selectedStatus => status;
  String get selectedGender => gender;

  getFilter({String? statusFrom, String? genderFrom}) {
    if (statusFrom != null) {
      status = statusFrom;
    }
    if (genderFrom != null) {
      gender = genderFrom;
    }
    emit(IsChekboolState.initial(status, gender));
  }
}




