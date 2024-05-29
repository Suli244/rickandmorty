import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_navigator_state.dart';
part 'bottom_navigator_cubit.freezed.dart';

class BottomNavigatorCubit extends Cubit<BottomNavigatorState> {
  BottomNavigatorCubit() : super(const BottomNavigatorState.initial(0));

  getCurrentPage(int index) {
    emit(BottomNavigatorState.initial(index));
  }
}

