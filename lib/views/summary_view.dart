import 'package:flutter/material.dart';
import 'package:template/theme/theme.dart';

List<bool> listAnswers = [
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true,
  true,
  false,
  false,
  true,
  true
];
List categories =
    ThemeCategories().listCategories + ThemeCategories().listCategories;

class SummaryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
        child: Padding(
      padding: EdgeInsets.all(35),
      child: Column(
        children: [
          Text("Scorescreen", style: Themes.textStyle.headline1),
          _scoreTable(),
          Expanded(child: _summaryTable()),
        ],
      ),
    ));
  }

  Widget _scoreTable() {
    int playerScore = 13;
    int settingsQuestions = 20;
    int wrongAnswers = (settingsQuestions - playerScore);
    double spaceBetween = 15;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _scoreCircle(
              number: playerScore,
              text: "Correct \nAnswers",
              color: Themes.colors.green),
          Container(
            width: spaceBetween,
          ),
          _scoreCircle(
              number: playerScore,
              text: "Wrong \nAnswers",
              color: Themes.colors.red),
          Container(
            width: spaceBetween,
          ),
          _scoreCircle(
              number: playerScore, text: "Total", color: Themes.colors.grey)
        ],
      ),
    );
  }

  Widget _scoreCircle(
      {required int number, required String text, required Color color}) {
    return Column(
      children: [
        Themes.icons.circle(
            child: Text(
              number.toString(),
              style: Themes.textStyle.headline1,
            ),
            color: color,
            size: 80),
        Container(
          height: 5,
        ),
        Text(
          text,
          style: Themes.textStyle.headline3,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _summaryTable() {
    return Column(
      children: [
        Text(
          "Summary",
          style: Themes.textStyle.headline2,
        ),
        Container(
          height: 0,
        ),
        _listView(listAnswers)
      ],
    );
  }

  Widget _listView(listAnswers) {
    return Expanded(
      child: Material(
        color: Color.fromARGB(0, 255, 255, 255),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: listAnswers.length,
            itemBuilder: (BuildContext context, int index) {
              return _listTile(index);
            }),
      ),
    );
  }

  Widget _listTile(index) {
    return Padding(
      padding: EdgeInsets.only(top: 3),
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 21,
                height: 21,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Themes.colors.grey),
                    color: categories[index].color,
                    shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  categories[index].icon,
                  color: Themes.colors.whiteBackground,
                  size: 14,
                )),
              ),
            )
          ],
        ),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                width: 3,
                color: listAnswers[index]
                    ? Themes.colors.green
                    : Themes.colors.red),
            color: listAnswers[index]
                ? Themes.colors.greenLight
                : Themes.colors.redLight),
      ),
    );
  }
}
