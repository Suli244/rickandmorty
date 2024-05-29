import 'package:dio/dio.dart';
import 'package:rikandmorty/features/person/data/models/person_model.dart';
import 'package:rikandmorty/features/person/domain/repoositories/get_persons_repo.dart';
import 'package:rikandmorty/server/catch_exception.dart';

class GetPersonRepoImpl implements GetPersonRepo {
  GetPersonRepoImpl({required this.dio});
  final Dio dio;

  @override
  Future<PersonModel> getPerson({
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required int currantPage,
  }) async {
    try {
      final response = await dio.get(
        'character',
        queryParameters: {
          'name': name,
          'status': status,
          'species': species,
          'type': species,
          'gender': gender,
          'page': currantPage,
        },
      );
      return PersonModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
