import 'package:auth_mobile_app/core/services/api_service.dart';
import 'package:auth_mobile_app/features/authentication/data/models/user_model.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> logIn (Map<String, String> data);
  Future<void> register (Map<String, String> data);
  Future<UserEntity> logInWithToken(Map<String, String> headers);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService _apiService;

  AuthRemoteDataSourceImpl({required ApiService apiService}) : _apiService = apiService;
  @override
  Future<UserEntity> logIn(Map<String, String> data) async {
    String endPoint = 'user/login';
    Map<String, dynamic> userData = await _apiService.post(endPoint, data);
    return UserModel.fromJson(userData);
  }

  @override
  Future<UserEntity> logInWithToken(Map<String, String> headers) async {
    String endPoint = 'user/me';
    Map<String, dynamic> userData = await _apiService.get(endPoint, headers);
    return UserModel.fromJson(userData);
  }

  @override
  Future<void> register(Map<String, String> data) async {
    String endPoint = 'users/add';
    await _apiService.post(endPoint, data);
  }
}