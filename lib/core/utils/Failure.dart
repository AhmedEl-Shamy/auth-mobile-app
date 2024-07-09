import 'package:dio/dio.dart';

class Failure {
  final String errMsg;

  Failure({required this.errMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMsg});

  factory ServerFailure.fromDioException(DioException dioException) {
    DioExceptionType dioExceptionType = dioException.type;
    switch (dioExceptionType) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMsg: 'Connection Timeout!');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMsg: 'Connection Timeout!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMsg: 'Connection Timeout!');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMsg: 'Bad Certificate!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errMsg: 'Connection Canceled!');
      case DioExceptionType.connectionError:
        return ServerFailure(
            errMsg:
                'Failed to connect with the server, check your internet connection!');
      case DioExceptionType.unknown:
        return ServerFailure(errMsg: 'Oops: Unexpected Error, please try again!');
    }
  }

  factory ServerFailure.fromResponse(Response response) {
    int statusCode = response.statusCode!;
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMsg: response.data['message']);
    } else if (statusCode == 404) {
      return ServerFailure(errMsg: 'Request not found!');
    } else if (statusCode >= 500) {
      return ServerFailure(
          errMsg: 'There was a problem with server, please try later!');
    } else {
      return ServerFailure(
          errMsg: 'Oops!, there was an error, Please try again!');
    }
  }
}
