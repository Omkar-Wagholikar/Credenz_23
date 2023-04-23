import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
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
        "senior": "false",
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

  Future<List<dynamic>> getEvents(
      // required BuildContext context,
      ) async {
    String headerString = '';
    try {
      var url = Uri.https('gist.githubusercontent.com',
          '/devrajshetake/e3ebe00b1b3ccf3e8a63e6de8da1b430/raw/c4cf8944101d4e11a0a964f376e8c53002e8fa99/events.json');
      var response = await http.get(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)[1]}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        // showSnackBar(context, headerString);
        return [];
      } else {
        print('Got Events');
        // showSnackBar(context, headerString);
        return jsonDecode(response.body) as List<dynamic>;
      }
    } catch (e) {
      print("error: ${e.toString()}");
      // showSnackBar(context, e.toString());
      return [];
    }
  }
}
