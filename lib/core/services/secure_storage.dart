// Default secure storage - Uses RSA OAEP + AES-GCM (recommended)
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Or with explicit Android options
  final storage = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(),
  );

  Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteKey(String key) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  Future<bool> checkIfKeyExists(String key) async {
    return await storage.containsKey(key: key);
  }
}
