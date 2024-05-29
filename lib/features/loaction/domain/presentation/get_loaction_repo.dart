import 'package:rikandmorty/features/loaction/data/models/loaction_model.dart';

abstract class GetLoactionRepo {
  Future<LocationModel> getLoaction({required String loactionName});
}
