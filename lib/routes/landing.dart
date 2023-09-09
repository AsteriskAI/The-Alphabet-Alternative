import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          Globals.logoImage,
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  createButton("Let's Go!", () {Navigator.pushNamed(context, '/selection');}, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
                  createButton("Game Rules", () {
                  }, Globals.globalColorScheme.onSurface, Globals.globalColorScheme.surfaceVariant),
                  createButton("Learn More!", () {
                  }, Globals.globalColorScheme.surface, Globals.globalColorScheme.onSurfaceVariant),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
