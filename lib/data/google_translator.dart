import 'package:translator/translator.dart';

final googleTranslator = GoogleTranslator();

// Maby I can use this if I translate somewhere else like before every question is loaded.
Future<String> translator(
    {required String text, required String languageCode}) async {
  Translation translated =
      await googleTranslator.translate(text, from: 'en', to: languageCode);
  return translated.text;
}
