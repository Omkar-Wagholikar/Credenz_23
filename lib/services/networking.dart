import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../constants/globals/widgets.dart';

class database {
  Future<bool> register({
    required BuildContext context,
    required String username,
    required String email,
    required String phone,
    required String first_name,
    required String last_name,
    required String password,
    required bool senior,
    required String institute,
  }) async {
    String headerString = '';
    try {
      var url = Uri.https('api.credenz.in', '/api/register/');

      Map<String, dynamic> body = {
        "username": username,
        "email": email,
        "phone": phone,
        "first_name": first_name,
        "last_name": last_name,
        "password": password,
        "senior": senior ? "true" : "false",
        "institute": institute,
      };

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        showSnackBar(context, headerString);
        return false;
      } else {
        headerString = 'Registration Successful';
        showSnackBar(context, headerString);
        return true;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      return false;
    }
  }

  Future<bool> login({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    String headerString = '';
    try {
      var url = Uri.https('api.credenz.in', '/api/login/');

      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        showSnackBar(context, headerString);
        return false;
      } else {
        headerString = 'Login Successful';
        showSnackBar(context, headerString);
        return true;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      return false;
    }
  }

  Future<List<dynamic>> getEvents() async {
    try {
      var url = Uri.https('gist.githubusercontent.com',
          '/devrajshetake/e3ebe00b1b3ccf3e8a63e6de8da1b430/raw/c4cf8944101d4e11a0a964f376e8c53002e8fa99/events.json');
      var response = await http.get(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)[1]}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {});
        return [];
      } else {
        print('Got Events');
        return jsonDecode(response.body) as List<dynamic>;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      return [];
    }
  }

  Future<bool> profile({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    String headerString = '';
    try {
      var url = Uri.https('api.credenz.in', '/api/profile/');

      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };
      // Map<String, String> headers = {
      //   'Authorization':
      //       'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjgyODQyMTMxLCJqdGkiOiIyNDBjMzYyZGQwMTI0OGVjOWY5OTQzNzIzNmI3NDNmYSIsInVzZXJfaWQiOjV9.7eYPV4PXfrEJtxRtIXPbIxge5Zk99i6RjcdXExiR0xA',
      // };
      Map<String, String> headers = {
        "Authorization":
            "Token ${await getHeaders(context: context, username: username, password: password)}",
        "Authentication":
            "Token ${await getHeaders(context: context, username: username, password: password)}",
      };

      var response = await http.post(url, body: body, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        showSnackBar(context, headerString);
        return false;
      } else {
        headerString = 'Login Successful';
        showSnackBar(context, headerString);
        return true;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      return false;
    }
  }

  Future<String> getHeaders({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    String headerString = '';
    try {
      var url = Uri.https('api.credenz.in', '/api/login/');

      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        showSnackBar(context, headerString);
        return "error";
      } else {
        headerString = 'Login Successful';
        showSnackBar(context, headerString);
        return jsonDecode(response.body)["access"];
      }
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      return e.toString();
    }
  }
}
