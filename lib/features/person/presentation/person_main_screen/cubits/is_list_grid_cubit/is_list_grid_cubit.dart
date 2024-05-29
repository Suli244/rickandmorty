import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'is_list_grid_state.dart';
part 'is_list_grid_cubit.freezed.dart';

class IsListGridCubit extends Cubit<IsListGridState> {
  IsListGridCubit() : super(const IsListGridState.initial(false));

  void isGridList(bool isGrid) {
    emit(IsListGridState.initial(!isGrid));
  }
}
