//imports here if needed
import 'dart:convert';
import 'package:http/http.dart' as http;

class OllamaManager {
  OllamaManager({this._baseUrl = 'http://localhost:11434', this._model = 'qwen2.5-coder:7b'});
  final String _baseUrl;
  final String _model;
  //final String _client = http.Client();

  Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse('$_baseUrl/api/generate'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'model': _model,
      'prompt': prompt,
      'stream': false,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception(
      'Failed to contact Ollama: ${response.statusCode}',
    );
  }

  final Map<String, dynamic> data =
      jsonDecode(response.body);

  return data['response'] ?? '';
}

}