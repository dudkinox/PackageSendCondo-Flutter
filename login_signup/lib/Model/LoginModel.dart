import 'dart:convert';

class LoginModel {
  final String ID;
  final String USERNAME;
  final String PASSWORD;
  final String TYPE;
  final String ROOM;
  final bool STATUS;
  LoginModel({
    this.ID,
    this.USERNAME,
    this.PASSWORD,
    this.TYPE,
    this.ROOM,
    this.STATUS,
  });
  factory LoginModel.fromJson(final json) {
    return LoginModel(
      ID: json['id'],
      USERNAME: json['username'],
      PASSWORD: json['password'],
      TYPE: json['type'],
      ROOM: json['room'],
      STATUS: json['status'],
    );
  }
}

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    this.id,
    this.email,
    this.lastname,
    this.name,
    this.password,
    this.phone,
    this.room,
    this.type,
    this.status,
  });

  String id;
  String email;
  String lastname;
  String name;
  String password;
  String phone;
  String room;
  String type;
  bool status;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        email: json["email"],
        lastname: json["lastname"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        room: json["room"],
        type: json["type"],
        status: json["status"],
      );


  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "lastname": lastname,
        "name": name,
        "password": password,
        "phone": phone,
        "room": room,
        "type": type,
        "status": status,
      };
}


