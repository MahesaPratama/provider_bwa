// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await http
          .get(Uri.parse('https://future-jobs-api.vercel.app/categories'));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<CategoryModel> categories = [];
        List parsedJson = jsonDecode(response.body);
        // ignore: avoid_function_literals_in_foreach_calls
        parsedJson.forEach((category) {
          categories.add(CategoryModel.fromJson(category));
        });
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
