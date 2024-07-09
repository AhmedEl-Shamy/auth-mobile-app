import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> get(String endPoint, Map<String, String> data);
  Future<Map<String, dynamic>> post(String endPoint, Map<String, String> data);
}

class ApiServiceImpl extends ApiService {
  final Dio _dio;
  static const String baseUrl = 'https://dummyjson.com/';
  ApiServiceImpl({required Dio dio}) : _dio = dio;
  @override
  Future<Map<String, dynamic>> get(
      String endPoint, Map<String, String> data) async {
    Response response =
        await _dio.get(baseUrl + endPoint, options: Options(headers: data));
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> post(
      String endPoint, Map<String, String> data) async {
    Response response = await _dio.post(baseUrl + endPoint, data: data);
    return response.data;
  }
}
