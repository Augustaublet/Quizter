import 'dart:convert';
import 'package:template/data/translation/open_ai_translater.dart';
import 'package:template/data/question.dart';

class Translator {
  Future<void> translatQuestion(Question question,
      {String targetLanguage = "swedish"}) async {
    TranslateOpenAI translateOpenAI = TranslateOpenAI();
    List<String> finalIncorrectTranslated = [];

    // Creating a Json format string containing the strings that is going to be translated.
    var questionJson = jsonEncode({
      "1": question.question,
      "2": question.correctAnswer,
      "3": jsonEncode(question.incorrectAnswer)
    });

    var translatedQuestionOpenAI = await translateOpenAI.getTranslate(
        questionJson: questionJson, language: targetLanguage);

    // rying to decode if there is an error this will try to get
    // another one. If that one fails it will just show in English.
    try {
      List incorrectTranslated = jsonDecode(translatedQuestionOpenAI["3"]);
      incorrectTranslated.forEach((element) {
        finalIncorrectTranslated.add(element.toString());
      });
    } catch (e) {
      print("##############");
      print(e);
      print("##############");

      var translatedQuestionOpenAI = await translateOpenAI.getTranslate(
          questionJson: questionJson, language: targetLanguage);
      List incorrectTranslated = jsonDecode(translatedQuestionOpenAI["3"]);
      incorrectTranslated.forEach((element) {
        finalIncorrectTranslated.add(element.toString());
      });
    }

    // updates the qustions with translated text.
    question.updateWithTranslation(translatedQuestionOpenAI["1"],
        translatedQuestionOpenAI["2"].toString(), finalIncorrectTranslated);
  }
}
