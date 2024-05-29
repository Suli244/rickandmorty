import 'package:dio/dio.dart';
import 'package:rikandmorty/features/loaction/data/models/loaction_model.dart';
import 'package:rikandmorty/features/loaction/domain/presentation/get_loaction_repo.dart';
import 'package:rikandmorty/server/catch_exception.dart';

class GetLoactionRepoImpl implements GetLoactionRepo {
  GetLoactionRepoImpl({required this.dio});
  final Dio dio;

  @override
  Future<LocationModel> getLoaction({required String loactionName}) async {
    try {
      final response =
          await dio.get('location', queryParameters: {'name': loactionName});

      return LocationModel.fromJson(response.data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
