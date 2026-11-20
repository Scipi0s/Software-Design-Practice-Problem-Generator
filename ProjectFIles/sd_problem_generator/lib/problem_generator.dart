import 'package:sd_problem_generator/ollama_manager.dart';
import 'package:sd_problem_generator/problem.dart';
import 'package:sd_problem_generator/problem_repository.dart';
import 'dart:math';

class ProblemGenerator {
  final OllamaManager _ollama;
  final ProblemRepository _problemRepository;
  final Random _random = Random();

  ProblemGenerator(this._ollama, this._problemRepository);

  List<Problem> selectContextProblems(){
    List<Problem> examples = [];

    List<Problem> problems = _problemRepository.getProblems();

    int randomIndex1 = _random.nextInt(problems.length);
    Problem example1 = problems[randomIndex1];
    examples.add(example1);
    int randomIndex2 = _random.nextInt(problems.length);
    Problem example2 = problems[randomIndex2];
    examples.add(example2);
    int randomIndex3 = _random.nextInt(problems.length);
    Problem example3 = problems[randomIndex3];
    examples.add(example3);

    return examples;
  }

  String buildPrompt(){
    List<Problem> examples = selectContextProblems();

    String prompt = "You are a software design specialist creating design problems to train college students on. Study the following JSON examples and generate a new problem mapping the result to the required fields. ";

    for (var entry in examples) {
      prompt += '$entry';
    }

    prompt += 'Return ONLY a valid JSON object matching this exact schema: { "project_title": "string", "project_description": "string", "assignment_definition": "string" } Do not include markdown formatting or conversational filler. ';

    return prompt;
  }

  Future<Problem> generateProblem() async {
    final prompt = buildPrompt();

    final response = await _ollama.generateText(prompt);

    final generatedProblem = Problem.fromJson(response as Map<String, dynamic>);

    return generatedProblem;
  }
}