// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../Model/job_model.dart';

class JobProvider with ChangeNotifier {
  Future<List<JobModel>?> getJobs() async {
    try {
      var response =
          await http.get(Uri.parse('https://future-jobs-api.vercel.app/jobs'));
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        // ignore: avoid_function_literals_in_foreach_calls
        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<JobModel>?> getJobsByCategory(String category) async {
    try {
      var response = await http.get(Uri.parse(
          'https://future-jobs-api.vercel.app/jobs?category=$category'));
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);

        // ignore: avoid_function_literals_in_foreach_calls
        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
