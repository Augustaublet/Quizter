import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/settings/widgets/language_dropdown.dart';
import '../../../data/translation/translation_settings.dart';

class LanguageSelectionRow extends StatelessWidget {
  const LanguageSelectionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateSettings>(
      builder: (BuildContext context, translateSettings, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Translate with AI",
                style: Themes.textStyle.headline3,
              ),
              Checkbox(
                  value: translateSettings.tranlateBool,
                  onChanged: (bool? value) =>
                      translateSettings.changeIsTranslating()),
            ],
          ),
          _languageSelectionDropdown(translateSettings.tranlateBool),
        ],
      ),
    );
  }

  Widget _languageSelectionDropdown(bool showLanguageSelector) {
    if (showLanguageSelector) {
      return DropdownLanguageButton();
    } else {
      return Container();
    }
  }
}
