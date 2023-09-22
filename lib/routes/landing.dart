import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';


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
                  createButton("Let's Go!", () {Navigator.pushNamed(context, '/selection');Globals.player.play(AssetSource('audio/general.mp3'));}, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
                  createButton("Game Rules", () {
                    Navigator.pushNamed(context, '/rulepage');
                    Globals.player.play(AssetSource('audio/general.mp3'));
                  }, Globals.globalColorScheme.onSurface, Globals.globalColorScheme.surfaceVariant),
                  createButton("Learn More!", () async {
                    Globals.player.play(AssetSource('audio/general.mp3'));
  const url = "https://linktr.ee/AlternativeAlphabetApp";
  
  try {  
      await launchUrl(Uri.parse(url));

  } catch (e) {
    Text('Error launching URL: $e');
  }
}, Globals.globalColorScheme.surface, Globals.globalColorScheme.onSurfaceVariant)

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
