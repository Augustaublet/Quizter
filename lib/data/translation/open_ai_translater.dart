import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:template/auth/top_secret.dart';

class TranslateOpenAI {
  final String _apiKey = openAIKey;
  final String _url = 'https://api.openai.com/v1/completions';

  String prompt =
      "Translate 'question' and 'correctAnswer' and 'incorrectAnswer' to swedish. Do not translate anything else. Format output as json. {x.json()[0]}";

  Future<dynamic> getTranslate(
      {required var questionJson, String language = "swedish"}) async {
    String prompt =
        //'Translate to swedish $questionJson. Return formated as a list []';
        "Translate 'question' and 'correctAnswer' and 'incorrectAnswer' to $language. Do not translate anything else. Format output as json. $questionJson";

    // I might need to prompt it?
    //String text = "Översätt till svenska \n $inputText";
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode(
        {
          'model': 'text-davinci-003',
          'prompt': prompt,
          'max_tokens': 250,
          'temperature': 0.7,
        },
      ),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      var temp = jsonDecode(data['choices'][0]['text']);
      List incorrectList = jsonDecode(temp["3"]);

      return jsonDecode(data['choices'][0]['text']);
    } else {
      return response.statusCode.toString(); // tevksam kod :o
    }
  }
}
