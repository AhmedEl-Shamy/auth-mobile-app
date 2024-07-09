import 'package:auth_mobile_app/core/services/secured_storage_service.dart';
import 'package:auth_mobile_app/features/authentication/data/models/user_model.dart';
import 'package:auth_mobile_app/features/authentication/domain/entities/user_entity.dart';

abstract class AuthLocalDataSource {
  Future<UserEntity> getUserData();
  Future<String?> getUserToken();
  Future<void> storeUserData(UserEntity user);
  Future<void> deleteUser();

}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SecuredStorageService _securedStorageService;

  AuthLocalDataSourceImpl(
      {required SecuredStorageService securedStorageService})
      : _securedStorageService = securedStorageService;

  @override
  Future<UserEntity> getUserData() async {
    Map<String, String> data = await _securedStorageService.readAll();
    UserEntity user = UserModel.fromJson(data);
    return user;
  }

  @override
  Future<String?> getUserToken() async {
    return await _securedStorageService.read(key: 'userToken');
  }

  @override
  Future<void> storeUserData(UserEntity user) async {
    await _securedStorageService.write(key: 'firstName', value: user.userFirstName);
    await _securedStorageService.write(key: 'lastName', value: user.userlastName);
    await _securedStorageService.write(key: 'email', value: user.userEmail);
    await _securedStorageService.write(key: 'token', value: user.userToken);
    await _securedStorageService.write(key: 'gender', value: user.userGender);
    await _securedStorageService.write(key: 'image', value: user.userImage);
  }
  
  @override
  Future<void> deleteUser() async {
    _securedStorageService.deleteAll();
  }
}
