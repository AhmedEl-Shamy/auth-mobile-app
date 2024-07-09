import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecuredStorageService {
  Future<void> write({required String key, required String value});
  Future<String?> read({required String key});
  Future<Map<String, String>> readAll();
  Future<void> deleteAll();
}

class SecuredStorageServiceImpl extends SecuredStorageService {
  final FlutterSecureStorage _secureStorage;

  SecuredStorageServiceImpl({required FlutterSecureStorage secureStorage})
      : _secureStorage = secureStorage;

  @override
  Future<String?> read({required String key}) {
    return _secureStorage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) {
    return _secureStorage.write(key: key, value: value);
  }
  
  @override
  Future<Map<String, String>> readAll() {
    return _secureStorage.readAll();
  }
  
  @override
  Future<void> deleteAll() {
    return _secureStorage.deleteAll();
  }
}
