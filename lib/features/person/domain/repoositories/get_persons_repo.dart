import 'package:rikandmorty/features/person/data/models/person_model.dart';

abstract class GetPersonRepo {
  Future<PersonModel> getPerson({
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required int currantPage,
  });
}
