import 'package:flutter/foundation.dart';

class LoginModel {
  final String ID;
  final String USERNAME;
  final String PASSWORD;
  final String TYPE;
  LoginModel({
    this.ID,
    this.USERNAME,
    this.PASSWORD,
    this.TYPE,
  });
  factory LoginModel.fromJson(final json) {
    return LoginModel(
      ID: json['id'],
      USERNAME: json['username'],
      PASSWORD: json['password'],
      TYPE: json['type'],
    );
  }
}
