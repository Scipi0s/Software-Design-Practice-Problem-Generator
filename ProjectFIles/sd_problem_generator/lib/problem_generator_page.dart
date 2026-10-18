import 'package:flutter/material.dart';
import 'package:sd_problem_generator/main.dart';

class ProblemGeneratorPage extends StatefulWidget {
  const ProblemGeneratorPage({super.key});


  @override
  State<ProblemGeneratorPage> createState() => _ProblemGeneratorPageState();
}

class _ProblemGeneratorPageState extends State<ProblemGeneratorPage> {
  
  String _resultString = '';
  String _requestPrompt = '';
  Map<String, bool> objectives = {
    'Structure Chart': false,
    'Data Flow Diagram': false,
    'Pseudocode for the most important function': false,
    'Algorithmic Efficiency calculation on one function': false,
    'Maintainability determination': false,
    'Cohesion and Coupling determination on every function': false,
    'Program Trace': false,
    'Test Cases': false,
    'Component Diagram': false,
    'Class Diagram for one class': false,
  };
  

  String _setRequestPrompt(){
    List<String> selectedobjectives = objectives.entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();



    _requestPrompt = "Create a design for a program that will fulfill the given request. The design must include the following: ${selectedobjectives.join(', ')}.";

    return _requestPrompt;
  }

  void _generateRequest() {
    setState(() {
      
      _setRequestPrompt();
      _resultString = _requestPrompt;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select Assignment Definition objectives from the list below and then press the Generate button to recieve a custom from our trained AI model. The Problem will be displayed at the bottom of the page.',
                textAlign: TextAlign.center,          // Aligns text to the center
              ),

              Text("Select Objectives:", style: TextStyle(fontSize: 12)),
            ...objectives.keys.map((genre) {
              return CheckboxListTile(
                title: Text(genre),
                value: objectives[genre],
                onChanged: (bool? value) {
                  setState(() {
                    objectives[genre] = value!;
                  });
                },
              );
            }),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,       // Button background color
                  foregroundColor: Colors.white,      // Text and icon color
                ),
                onPressed: () {
                  _generateRequest();
                },
              child: const Text('Generate Problem'),
              ),
              const SizedBox(height: 16),
              Text(
              'Assignment Definition',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ), // Adds space between the buttons
              Text(
              _resultString ?? '',
              textAlign: TextAlign.center,
),
          ],
        ),
      ),
    );
  }
}