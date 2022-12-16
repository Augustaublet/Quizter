import 'dart:convert';

import 'package:template/data/open_ai_translater.dart';
import 'package:template/data/question.dart';
import 'package:template/data/libre_translator.dart';
import 'package:translator/translator.dart';

class TranslatorTesting {
  bool useTranslator = false;
  String translateTo = "sv";

  Future<void> translatQuestion(Question question,
      {String targetLanguage = "sv"}) async {
    LibreTranslateAPI tranlator = LibreTranslateAPI();
    GoogleTranslator googleTranslator = GoogleTranslator();
    TranslateOpenAI translateOpenAI = TranslateOpenAI();

    List queryList = [];
    queryList.add(question.question);
    queryList.add(question.correctAnswer);
    for (String i in question.incorrectAnswer) {
      queryList.add(i);
    }
    // var questionJson = jsonEncode({
    //   "question": question.question,
    //   "correctAnswer": question.correctAnswer,
    //   "incorrectAnswer": jsonEncode(question.incorrectAnswer)
    // });

    var questionJson = jsonEncode({
      "1": question.question,
      "2": question.correctAnswer,
      "3": jsonEncode(question.incorrectAnswer)
    });

    // Original string and print
    String csvTranslationString =
        '${question.question};${question.correctAnswer};${question.incorrectAnswer[0]};${question.incorrectAnswer[1]};${question.incorrectAnswer[2]};';
    // print("Original ;$csvTranslationString");

    // Stopwatch librestopwatch = new Stopwatch()..start();
    // var translatedQuestionLibreCSV =
    //     await tranlator.translate(q: csvTranslationString, target: "sv");
    // librestopwatch.stop();

    // var translatedQuestionLibre =
    //     await tranlator.translate(q: queryList, target: "sv");

    Stopwatch googlestopwatch = new Stopwatch()..start();
    var translatedQuestionGoogle = await googleTranslator
        .translate(csvTranslationString, from: "en", to: "sv");
    googlestopwatch.stop();

    Stopwatch openAIstopwatch = new Stopwatch()..start();
    var translatedQuestionOpenAI =
        await translateOpenAI.getTranslate(questionJson);
    openAIstopwatch.stop();
    // Map<dynamic, dynamic> test = jsonDecode(translatedQuestionopenAI);
    List incorrectTranslated = jsonDecode(translatedQuestionOpenAI["3"]);
    String translatedOpenAI =
        "${translatedQuestionOpenAI["1"]},${translatedQuestionOpenAI["2"]},${incorrectTranslated[0]},${incorrectTranslated[1]},${incorrectTranslated[2]}";

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
    print(
        "Google; Time: ${googlestopwatch.elapsed.toString()} ;$translatedQuestionGoogle");
    print(
        "OpenAI; Time: ${openAIstopwatch.elapsed.toString()}; $translatedOpenAI");
  }
}
