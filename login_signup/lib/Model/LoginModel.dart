import 'dart:convert';


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


AccountModel accountModelFromJson(String str) => AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
    AccountModel({
        this.email,
        this.lastname,
        this.name,
        this.password,
        this.phone,
        this.room,
        this.type,
    });

    String email;
    String lastname;
    String name;
    String password;
    String phone;
    String room;
    String type;

    factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        email: json["email"],
        lastname: json["lastname"],
        name: json["name"],
        password: json["password"],
        phone: json["phone"],
        room: json["room"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "lastname": lastname,
        "name": name,
        "password": password,
        "phone": phone,
        "room": room,
        "type": type,
    };
}

