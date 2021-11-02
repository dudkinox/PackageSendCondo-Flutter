// ignore_for_file: missing_return

import 'dart:convert';
import 'package:login_signup/Database/Host.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/Model/LoginModel.dart';

Future<LoginModel> getLoginData(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return LoginModel.fromJson(jsonDecode(response.body));
}

Future<String> Register(
  String name,
  String lastname,
  String room,
  String email,
  String phone,
  String password,
) async {
  try {
    final String Url = Host + "/api/login";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "type": "user",
        "name": name,
        "lastname": lastname,
        "room": room,
        "email": email,
        "phone": phone,
        "password": password,
        "status": false
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<AccountModel> FindID(String token) async {
  try {
    final String url = Host + "/api/login/" + token;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return AccountModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
  }
}

Future<String> DeleteID(String token) async {
  try {
    final String url = Host + "/api/login/" + token;
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return "ลบสำเร็จ";
  } catch (e) {
    print(e);
  }
}

Future<List<AccountModel>> FilterID() async {
  try {
    final String url = Host + "/api/login/";
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new AccountModel.fromJson(data)).toList();
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateProfilePassword(
  String name,
  String email,
  String phone,
  String password,
  String token,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "phone": phone,
        "password": password
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UpdateProfile(
  String name,
  String email,
  String phone,
  String token,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "phone": phone,
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> AcceptUser(
  String token,
) async {
  try {
    final String Url = Host + "/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "status": true
      }),
    );
    return "ยอมรับสำเร็จ";
  } catch (e) {
    print(e);
  }
}

Future<List<AccountModel>> DataUser() async {
  final String url = Host + "/api/login";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new AccountModel.fromJson(data)).toList();
}
