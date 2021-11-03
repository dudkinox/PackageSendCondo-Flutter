// ignore_for_file: non_constant_identifier_names, missing_return

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> SendEmailForGotPassword(String email) async {
  final String url =
      "https://api-find-job-app.herokuapp.com/api/forgot/email/" + email;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  var data = json.decode(json.encode(response.body));
  return data;
}

Future<String> VerifyEmail(String verify) async {
  final String url =
      "https://api-find-job-app.herokuapp.com/api/forgot/verify/" + verify;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return response.body;
}

Future<String> ChangePassword(String password, String token) async {
  try {
    final String Url =
        "https://api-find-job-app.herokuapp.com/api/login/" + token;
    final response = await http.put(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"password": password}),
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

//
