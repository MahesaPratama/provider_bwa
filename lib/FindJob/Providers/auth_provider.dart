// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Model/user_model.dart';

class AuthProvider with ChangeNotifier {
  Future<UserModel?> register(
    String email,
    String password,
    String name,
    String goal,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };

      var response = await http.post(
        Uri.parse('https://future-jobs-api.vercel.app/register'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> login(
    String email,
    String password,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://future-jobs-api.vercel.app/login'),
        body: body,
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
