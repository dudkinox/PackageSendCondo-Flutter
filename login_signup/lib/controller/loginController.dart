import 'dart:convert';
import 'package:login_signup/Database/Host.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getLoginData(String username, String password) async {
  final String url = Host + "/api/login/" + username + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  print("Test Login: " + data);
  return data;
}

Future<String> Register(
  String username,
  String password,
) async {
  try {
    final String Url = Host + "/api/login";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "type": "user",
        "username": username,
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
