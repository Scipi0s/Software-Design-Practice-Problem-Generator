import 'dart:convert';
import 'package:sd_problem_generator/problem.dart';
import 'package:flutter/services.dart';

class ProblemRepository {
  List<Problem> problems = [];

  Future<void> loadProblems() async {
    final jsonString =
    await rootBundle.loadString(
        'assets/problems.json');

    final List<dynamic> data =
    jsonDecode(jsonString);

    problems = data
    .map((entry) => Problem.fromJson(entry))
    .toList();
  }

  List<Problem> getProblems(){
    return problems;
  }
}