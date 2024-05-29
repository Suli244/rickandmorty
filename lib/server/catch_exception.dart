import 'package:dio/dio.dart';

class CatchException {
  CatchException({required this.message});
  final String message;

  static CatchException convertException(dynamic error) {
    if (error is DioError) {
      if (error.type == DioErrorType.connectionTimeout) {
        return CatchException(
            message: 'Привышено время обработки запроса.\nПовторите позднее');
      } else if (error.type == DioErrorType.receiveTimeout) {
        return CatchException(
            message: 'Привышено время обработки запроса.\nПовторите позднее');
      } else if (error.response == null) {
        return CatchException(message: 'Нет интернет соединения');
      } else if (error.response!.statusCode == 405) {
        return CatchException(message: 'Запрос отклонен');
      } else if (error.response!.statusCode == 400) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 409) {
        return CatchException(message: error.response!.data['message']);
      } else if (error.response!.statusCode == 500) {
        return CatchException(message: error.response!.data['message']);
      } else {
        return CatchException(message: 'Персонаж с таким именем \nне найден');
      }
    }
    if (error is CatchException) {
      return error;
    } else {
      return CatchException(message: error.response!.data['error']);
    }
  }
}
