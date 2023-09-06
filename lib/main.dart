import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
import 'routes/landing.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(       
        theme: ThemeData(useMaterial3: true, colorScheme: ColorSchemes, fontFamily: 'Bauhaus'),
        initialRoute: "/landing",
        routes: {
          "/landing": (context) => LandingPage(),
        });
  }
}
