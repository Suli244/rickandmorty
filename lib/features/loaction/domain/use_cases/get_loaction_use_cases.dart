import 'package:rikandmorty/features/loaction/data/models/loaction_model.dart';
import 'package:rikandmorty/features/loaction/domain/presentation/get_loaction_repo.dart';

class GetLoactionUseCase {
  GetLoactionUseCase({required this.repo});
  final GetLoactionRepo repo;

  List<ResultLoactionModel> loactionList = [];

  Future<LocationModel> getLoaction({required String loactionName}) async {
    try {
      final result = await repo.getLoaction(
        loactionName: loactionName,
      );
      loactionList.addAll(result.results);
      return result.copyWith(results: loactionList);
    } catch (e) {
      rethrow;
    }
  }
}
