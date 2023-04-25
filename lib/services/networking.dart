import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/globals/widgets.dart';

class database {
  Future<SharedPreferences> prefs_ = SharedPreferences.getInstance();

  Future<void> test() async {
    // final SharedPreferences prefs = await prefs_;
    // prefs.setString('access', 'test');
    // print(prefs.getString("access"));
  }

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
    final SharedPreferences prefs = await prefs_;

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

      try {
        String token = jsonDecode(response.body)["access"];
        prefs.setString('access', token);
      } catch (e) {
        String error = "Error in registeration";
        print(error);
        showSnackBar(context, error);
      }

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
      final SharedPreferences prefs = await prefs_;

      Map<String, dynamic> body = {
        "username": username,
        "password": password,
      };

      var response = await http.post(url, body: body);

      print('Response status: ${response.statusCode}');
      print('Response body: ${jsonDecode(response.body)["access"]}');

      prefs.setString("access", jsonDecode(response.body)["access"]);

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
  }) async {
    String headerString = '';
    try {
      var url = Uri.https('api.credenz.in', '/api/profile/');

      Map<String, String> headers = {
        "Authorization": "Bearer ${await getHeaders(context: context)}",
      };

      var response = await http.get(url, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode != 200) {
        jsonDecode(response.body).forEach((key, value) {
          headerString += '$key:$value\n';
        });
        showSnackBar(context, headerString);
        return false;
      } else {
        headerString = 'Got Profile Details';
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
  }) async {
    final SharedPreferences prefs = await prefs_;
    try {
      String? token = prefs.getString("access");
      if (token != null) {
        return token;
      } else {
        showSnackBar(context, "access token not found");
        return "access token not found";
      }
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      return e.toString();
    }
  }

  Future<List<dynamic>> getOrders({required BuildContext context}) async {
    var url = Uri.https('api.credenz.in', '/api/orders/');
    Map<String, String> headers = {
      "Authorization": "Bearer ${await getHeaders(context: context)}",
    };

    var response = await http.get(url, headers: headers);
    print(jsonDecode(response.body));
    return jsonDecode(response.body) as List<dynamic>;
  }

  Future<void> placeOrders({
    required BuildContext context,
    required List<String> eventList,
    required String transactionId,
    required String amount,
  }) async {
    final SharedPreferences prefs = await prefs_;
    String token = prefs.getString("access") ?? "";
    try {
      var url = Uri.https('api.credenz.in', '/api/placeorder/');

      Map<String, dynamic> body = {
        "event_list": eventList.toString(),
        "transaction_id": transactionId,
        "amount": amount,
      };

      Map<String, String> headers = {
        "Authorization": "Bearer ${await getHeaders(context: context)}",
      };

      var response = await http.post(url, body: body, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print("error: ${e.toString()}");
      showSnackBar(context, e.toString());
      // return false;
    }
  }
}
