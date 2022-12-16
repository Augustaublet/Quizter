import 'dart:convert';
import 'package:template/data/translation/open_ai_translater.dart';
import 'package:template/data/question.dart';

class Translator {
  Future<void> translatQuestion(Question question,
      {String targetLanguage = "swedish"}) async {
    TranslateOpenAI translateOpenAI = TranslateOpenAI();

    // Creating a Json format string containing the strings that is going to be translated.
    var questionJson = jsonEncode({
      "1": question.question,
      "2": question.correctAnswer,
      "3": jsonEncode(question.incorrectAnswer)
    });

    var translatedQuestionOpenAI = await translateOpenAI.getTranslate(
        questionJson: questionJson, language: targetLanguage);

    print(translatedQuestionOpenAI);
    // Map<dynamic, dynamic> test = jsonDecode(translatedQuestionopenAI);
    List incorrectTranslated = jsonDecode(translatedQuestionOpenAI[3]);
    List<String> finalIncorrectTranslated = [];
    incorrectTranslated.forEach((element) {
      finalIncorrectTranslated.add(element.toString());
    });

    // String translatedOpenAI =
    //     "${translatedQuestionOpenAI["1"]},${translatedQuestionOpenAI["2"]},${incorrectTranslated[0]},${incorrectTranslated[1]},${incorrectTranslated[2]}";

    question.updateWithTranslation(translatedQuestionOpenAI["1"],
        translatedQuestionOpenAI["2"].toString(), finalIncorrectTranslated);
    // ignore: empty_catches
  }
}
