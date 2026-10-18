import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sd_problem_generator/main.dart';

class ProblemRandomizerPage extends StatefulWidget {
  const ProblemRandomizerPage({super.key});


  @override
  State<ProblemRandomizerPage> createState() => _ProblemRandomizerPageState();
}

class _ProblemRandomizerPageState extends State<ProblemRandomizerPage> {
  final ListRandomizer _randomizer = ListRandomizer();

  String _title = '';
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the Randomize button below to receive a random Practice Problem from the database.',
              textAlign: TextAlign.center,
            ),

            ElevatedButton(
              onPressed: () {
                final result = _randomizer.selectRandomItem();

                setState(() {
                  _title = result.$1;
                  _description = result.$2;
                });
              },
              child: const Text('Randomize'),
            ),

            const SizedBox(height: 16),

            Text(
              _title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              _description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


class ListRandomizer {
  final List<(String, String)> _scenarioList = [
    ('Title1', 'Description1'),
    ('Title2', 'Description2'),
    ('Title3', 'Description3'),
    ('Title4', 'Description4'),
    ('Title5', 'Description5'),
  ];

  final Random _random = Random();

  (String, String) selectRandomItem() {
    int randomIndex = _random.nextInt(_scenarioList.length);
    return _scenarioList[randomIndex];
  }
}