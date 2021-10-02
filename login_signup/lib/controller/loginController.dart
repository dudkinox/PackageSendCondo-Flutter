import 'dart:convert';
import 'package:login_signup/Database/Host.dart';
import 'package:login_signup/Model/LoginModel.dart';
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

Future<List<LoginModel>> insertLoginData() async {
  final String url = Host + "/api/login";
  final response = await http.post(Uri.parse(url));
  if (response.statusCode == 200) {
    var datas = json.decode(response.body);
    return datas.map<LoginModel>((json) => LoginModel.fromJson(json)).toList();
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
