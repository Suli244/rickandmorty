import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/features/person/domain/repoositories/get_persons_repo.dart';

class GetPersonUseCase {
  GetPersonUseCase({required this.repo});
  final GetPersonRepo repo;

  List<ResultPersonModel> personList = [];

  Future<PersonModel> getPerson({
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required int currantPage,
  }) async {
    try {
      final result = await repo.getPerson(
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        currantPage: currantPage,
      );
      personList.addAll(result.results);
      return result.copyWith(results: personList);
    } catch (e) {
      rethrow;
    }
  }
}






