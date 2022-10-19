import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';
import 'package:template/views/start_view.dart';

import '../views/settings_view.dart';

class EndGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StartView()));
      },
      color: Themes.colors.backgroundMiddle,
      textColor: Colors.white,
      padding: EdgeInsets.all(0),
      minWidth: 0,
      shape: CircleBorder(),
      child: Icon(
        Themes.icons.wrong,
        size: 24,
      ),
    );
  }
}
