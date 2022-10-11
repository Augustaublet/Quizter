import 'package:flutter/material.dart';

class Themes {
  static ThemeColors colors = ThemeColors();

  static ThemeCategory category(String key) {
    return ThemeCategories()
        .listCategories
        .where((category) => category.name == key)
        .first;
  }
}

class ThemeColors {
  // Färger för varje kategori
  final Color artLiterature = const Color(0xff1D83C5);
  final Color filmTv = const Color(0xffF04349);
  final Color foodDrink = const Color(0xffFCB752);
  final Color generalKnowledge = const Color(0xffF47D55);
  final Color geography = const Color(0xffA4CD63);
  final Color history = const Color(0xff7E4D9F);
  final Color music = const Color(0xff54BB77);
  final Color science = const Color(0xffDFE34E);
  final Color societyCulture = const Color(0xff53DAF8);
  final Color sportLeisure = const Color(0xffD04DC3);

  // Övriga färger

  final textGrey = Color(0xff3A3A3A);
  final whiteBackground = Color(0xffEAEAEA);
  final backgroundMiddle = Color.fromARGB(248, 0, 41, 72);
  final backgroundDark = Color(0xff0A1D2D);
  final backgroundLight = Color(0xff298298);

  final greenLight = Color(0xffD9FFD2);
  final green = Color(0xff83D775);
  final greenDark = Color(0xff102C0C);

  final redLight = Color(0xffE79494);
  final red = Color(0xffD64545);
  final redDark = Color(0xff391515);

  final yellowLight = Color(0xffE7C694);
  final yellow = Color(0xffD6B645);
  final yellowDark = Color(0xff392D15);

  final greyLight = Color(0xff9FA9B5);
  final grey = Color(0xff465E77);
  final greyDark = Color(0xff182837);

  final blueLight = Color(0xff4E9CBD);
  final blueDark = Color(0xff22566C);
}

class ThemeCategory {
  final String name;
  final Color color;
  final IconData icon;

  ThemeCategory({required this.name, required this.color, required this.icon});
}

class ThemeCategories {
  final List<ThemeCategory> listCategories = [
    ThemeCategory(
        name: 'Art & Literature',
        color: Themes.colors.artLiterature,
        icon: Icons.color_lens),
    ThemeCategory(
        name: 'Film & TV', color: Themes.colors.filmTv, icon: Icons.movie),
    ThemeCategory(
        name: 'Food & Drink',
        color: Themes.colors.foodDrink,
        icon: Icons.fastfood),
    ThemeCategory(
        name: 'General Knowledge',
        color: Themes.colors.generalKnowledge,
        icon: Icons.lightbulb),
    ThemeCategory(
        name: 'Geography', color: Themes.colors.geography, icon: Icons.public),
    ThemeCategory(
        name: 'History', color: Themes.colors.history, icon: Icons.music_note),
    ThemeCategory(
        name: 'Music', color: Themes.colors.music, icon: Icons.castle),
    ThemeCategory(
        name: 'Science', color: Themes.colors.science, icon: Icons.science),
    ThemeCategory(
        name: 'Society & Culture',
        color: Themes.colors.societyCulture,
        icon: Icons.account_balance),
    ThemeCategory(
        name: 'Sport & Leisure',
        color: Themes.colors.sportLeisure,
        icon: Icons.sports_soccer),
  ];
}

class ScaffoldWithBackground extends StatelessWidget {
  final Widget child;

  ScaffoldWithBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroundimage.jpg'),
                fit: BoxFit.cover)),
      ),
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Themes.colors.backgroundDark,
              Themes.colors.backgroundMiddle,
              Themes.colors.backgroundLight
            ])),
      ),
      child
    ]));
  }
}
