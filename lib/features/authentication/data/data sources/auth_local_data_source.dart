import 'package:auth_mobile_app/core/services/secured_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<String?> getUserToken();
  Future<void> storeUserToken(String token);
  Future<void> deleteUser();

}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SecuredStorageService _securedStorageService;

  AuthLocalDataSourceImpl(
      {required SecuredStorageService securedStorageService})
      : _securedStorageService = securedStorageService;

  @override
  Future<String?> getUserToken() async {
    return await _securedStorageService.read(key: 'userToken');
  }

  @override
  Future<void> storeUserToken(String token) async {
    await _securedStorageService.write(key: 'userToken', value: token);
  }
  
  @override
  Future<void> deleteUser() async {
    _securedStorageService.deleteAll();
  }
}
