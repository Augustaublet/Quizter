import 'package:flutter/cupertino.dart';

class TranslateSettings extends ChangeNotifier {
  bool _translate = true;
  String _selectedLanguage = "swedish";
  final List<String> _languageList = [
    "swedish",
    "french",
    "german",
    "danish",
    "norwegian",
    "finnish"
  ];

  get tranlateBool => _translate;
  get selectedLanguage => _selectedLanguage;
  get languages => _languageList;

  void changeIsTranslating() {
    _translate = !_translate;
    notifyListeners();
  }

  void languageSelection(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners();
  }
}
