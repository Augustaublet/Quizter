import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/translation/translation_settings.dart';
import '../../../theme/theme.dart';

class DropdownLanguageButton extends StatefulWidget {
  DropdownLanguageButton({super.key});

  @override
  State<DropdownLanguageButton> createState() => _DropdownLanguageButtonState();
}

class _DropdownLanguageButtonState extends State<DropdownLanguageButton> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue =
        Provider.of<TranslateSettings>(context, listen: true).selectedLanguage;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward, color: Colors.blue),
      dropdownColor: Themes.colors.backgroundLight,
      elevation: 16,
      style: Themes.textStyle.headline2,
      underline: Container(
        height: 2,
        color: Themes.colors.backgroundLight,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          Provider.of<TranslateSettings>(context, listen: false)
              .languageSelection(value);
        });
      },
      items: Provider.of<TranslateSettings>(context, listen: false)
          .languages
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
