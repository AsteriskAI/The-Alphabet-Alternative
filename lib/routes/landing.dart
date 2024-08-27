import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    createButton("Let's Go!", () {
                      Navigator.pushNamed(context, '/mode');
                      Globals.player.play(AssetSource('audio/button.mp3'));
                    }, Globals.globalColorScheme.scrim,
                        Globals.globalColorScheme.outlineVariant),
                    createButton("Tutorial", () {
                      Navigator.pushNamed(context, '/tutorial');
                      Globals.currentTutorialStep = 1;
                      Globals.player.play(AssetSource('audio/button.mp3'));
                    }, const Color.fromARGB(255, 186, 173, 232),
                        const Color.fromARGB(255, 96, 74, 179)),
                    createButton("Game Rules", () {
                      Navigator.pushNamed(context, '/rulepage');
                      Globals.player.play(AssetSource('audio/button.mp3'));
                    }, Globals.globalColorScheme.onSurface,
                        Globals.globalColorScheme.surfaceContainerHighest),
                    createButton("Explore!", () async {
                      Globals.player.play(AssetSource('audio/button.mp3'));
                      const url = "https://linktr.ee/AlternativeAlphabetApp";

                      try {
                        await launchUrl(Uri.parse(url));
                      } catch (e) {
                        Text('Error launching URL: $e');
                      }
                    }, Globals.globalColorScheme.surface,
                        Globals.globalColorScheme.onSurfaceVariant)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
