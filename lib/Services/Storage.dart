import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class SecureStorage {
  final storage = FlutterSecureStorage();

  Future writesSecureData(String key, String value) async {
    var writeData = await storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await storage.read(key: key);
    return readData;
  }

  Future removeSecureData(String key) async {
    var removeData = await storage.delete(key: key);
    return removeData;
  }
}
