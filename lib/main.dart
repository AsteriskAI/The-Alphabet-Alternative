import 'package:alphabetalternative/routes/classic.dart';
import 'package:alphabetalternative/routes/rules.dart';
import 'package:alphabetalternative/routes/scoreboard.dart';
import 'package:alphabetalternative/routes/selection.dart';
import 'package:alphabetalternative/routes/selectname.dart';
import 'package:alphabetalternative/routes/tutorial.dart';
import 'package:alphabetalternative/routes/twist.dart';
import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
import 'routes/landing.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key,});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemes,
        fontFamily: 'Bauhaus',
      ),
      initialRoute: "/landing",
      routes: {
        "/selection": (context) => const Selection(),
        "/landing": (context) => const LandingPage(),
        "/classic": (context) => const ClassicMode(),
        "/rulepage": (context) => const RulePage(),
        "/twist": (context) => const TwistMode(),
        "/scoreboard": (context) => const ScoreBoard(),
        "/tutorial": (context) => const Tutorial(),
        "/name":(context) => const SelectName(),
      },
      // Full screen and portrait mode
      debugShowCheckedModeBanner: false,
    );
  }
}
