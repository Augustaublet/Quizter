import 'dart:convert';
import 'dart:ffi';
import 'package:template/data/open_ai_translater.dart';
import 'package:template/data/question.dart';
import 'package:translator/translator.dart';

class TranslatorTesting {
  bool useTranslator = false;
  String translateTo = "sv";

  Future<void> translatQuestion(Question question,
      {String targetLanguage = "sv"}) async {
    TranslateOpenAI translateOpenAI = TranslateOpenAI();

    // Creating a Json format string containing the strings that is going to be translated.
    var questionJson = jsonEncode({
      "1": question.question,
      "2": question.correctAnswer,
      "3": jsonEncode(question.incorrectAnswer)
    });

    var translatedQuestionOpenAI =
        await translateOpenAI.getTranslate(questionJson);

    // Map<dynamic, dynamic> test = jsonDecode(translatedQuestionopenAI);
    // List incorrectTranslated = jsonDecode(translatedQuestionOpenAI["3"]);
    // String translatedOpenAI =
    //     "${translatedQuestionOpenAI["1"]},${translatedQuestionOpenAI["2"]},${incorrectTranslated[0]},${incorrectTranslated[1]},${incorrectTranslated[2]}";

    question.updateWithTranslation(
        translatedQuestionOpenAI["1"],
        translatedQuestionOpenAI["2"],
        jsonDecode(translatedQuestionOpenAI["3"]));
    // List templist = [];
    // test.forEach((k, v) => templist.add(v));

    // String translatedQuestion = templist[0];
    // String translatedCorrectAnswer = templist[1];
    // var incorrectAnswers = templist[2];
    // List<String> translatedIncorrectAnswers = [];
    // for (var x in incorrectAnswers) {
    //   translatedIncorrectAnswers.add(x.toString());
    // }

    // print(
    //     "$translatedQuestion, $translatedCorrectAnswer, $translatedIncorrectAnswers");

    // print("Original; Time:;$csvTranslationString");
    // print(
    //     "LibreTranslateCSV; Time: ${librestopwatch.elapsed.toString()} ;$translatedQuestionLibreCSV");
    //print(
    //    "LibreTranslate; Time: ${librestopwatch.elapsed.toString()};$translatedQuestionLibre");
  }
}
