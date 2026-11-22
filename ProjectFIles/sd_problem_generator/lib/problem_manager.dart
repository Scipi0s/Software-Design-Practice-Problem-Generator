import 'package:sd_problem_generator/problem.dart';
import 'package:sd_problem_generator/problem_randomizer.dart';
import 'package:sd_problem_generator/problem_generator.dart';
import 'package:flutter/foundation.dart';

class ProblemManager {
  ValueNotifier<Problem?> result = ValueNotifier(null);

  final ProblemRandomizer _randomizer;
  final ProblemGenerator _generator;

  ProblemManager({
    required this._generator,
    required this._randomizer,
  });

  Future<void> useGenerator() async {
    //displayResult();
    result.value = await _generator.generateProblem();

  }

  void useRandomizer() {
    //displayResult();
    result.value = _randomizer.selectRandomProblem();

  }

  

}