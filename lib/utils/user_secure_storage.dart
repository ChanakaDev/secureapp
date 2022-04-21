import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  // New instance of flutter secure storage.
  static const _storage = FlutterSecureStorage();

  // Key 'username'.
  static const _keyUserName = 'username';
  // Key 'pets'.
  static const _keyPets = 'pets';
  // Ket 'birthday'.
  static const _keyBirthday = 'birthday';

  // Setter method for key 'username'.
  static Future setUserName(String username) async =>
      // Save data locally encrypted.
      await _storage.write(key: _keyUserName, value: username);

  // Getter method for key 'username'.
  static Future<String?> getUserName() async =>
      // Read data from secure storage.
      await _storage.read(key: _keyUserName);

  // Setter method to save list of data.
  static Future setPets(List<String> pets) async {
    final value = json.encode(pets);
    await _storage.write(key: _keyPets, value: value);
  }

  // Getter method to get list of data.
  static Future<List<String>?> getPets() async {
    final value = await _storage.read(key: _keyPets);
    return value == null ? null : List<String>.from(json.decode(value));
  }

  // Setter method to save dateTime.
  static Future setBirthday(DateTime dateOfBirth) async {
    final birthday = dateOfBirth.toIso8601String();
    await _storage.write(key: _keyBirthday, value: birthday);
  }

  // Getter method to get dateTime.
  static Future<DateTime?> getBirthday() async {
    final birthday = await _storage.read(key: _keyBirthday);
    return birthday == null ? null : DateTime.tryParse(birthday);
  }
}
