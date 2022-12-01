import 'package:template/data/libre_translator.dart';

void main() async {
  var translator = LibreTranslateAPI();
  print(await translator.translate(q: "is it snow outside", target: "sv"));
  print(await translator.detect(q: "är det snö ute"));
}
