import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikandmorty/features/loaction/data/models/loaction_model.dart';
import 'package:rikandmorty/features/loaction/domain/presentation/get_loaction_repo.dart';
import 'package:rikandmorty/server/catch_exception.dart';

part 'get_loactions_state.dart';
part 'get_loactions_cubit.freezed.dart';

class GetLoactionsCubit extends Cubit<GetLoactionsState> {
  GetLoactionsCubit({required this.repo})
      : super(const GetLoactionsState.loading()) {
    getLoaction();
  }

  final GetLoactionRepo repo;
  String loactionName = '';

  Future<void> getLoaction({String? nameFrom}) async {
    if (nameFrom != null) {
      loactionName = nameFrom;
    }
    emit(const GetLoactionsState.loading());
    try {
      final result = await repo.getLoaction(loactionName: loactionName);

      emit(GetLoactionsState.success(
          result.copyWith(results: List.from(result.results))));

    } catch (e) {
      emit(GetLoactionsState.error(CatchException.convertException(e)));
    }
  }
}
