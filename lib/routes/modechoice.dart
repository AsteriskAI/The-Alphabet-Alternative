import 'package:alphabetalternative/color_schemes.g.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/lettercard.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/button.dart';

class ModeChoice extends StatefulWidget {
  const ModeChoice({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ModeChoiceState createState() => _ModeChoiceState();
}

class _ModeChoiceState extends State<ModeChoice> {
  bool isGameMode1Selected = true;
  String gamemodess = '';
  CardDeckData cardDeckData = CardDeckData();
  bool isGameMode2Selected = true;

  void resetCardStates() {
    setState(() {
      ActionCard.isDown = false;
      LetterCard.isDown = false;
    });
  }

  @override
  void initState() {
    super.initState();
    Globals.numberOfPlayers = 2;
  }

  @override
  Widget build(BuildContext context) {
    if (isGameMode1Selected) {
      gamemodess = '/selection';
    } else if (isGameMode2Selected) {
      gamemodess = '/single';
    }
    Globals.gamemodes = gamemodess;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Stack(
          children: [
            Globals.logoImage,
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          createButton(
                            'MultiPlayer',
                            () {
                              setState(() {
                                isGameMode1Selected = true;
                                isGameMode2Selected = false;
                              });
                            },
                            isGameMode1Selected
                                ? Globals.globalColorScheme.error
                                : Globals.globalColorScheme.onError
                                    .withOpacity(0.12),
                            isGameMode1Selected
                                ? buttoncolor
                                : Globals.globalColorScheme.onTertiary,
                          ),
                          createButton(
                            'SinglePlayer',
                            () {
                              setState(() {
                                isGameMode2Selected = true;
                                isGameMode1Selected = false;
                              });
                            },
                            isGameMode2Selected
                                ? Globals.globalColorScheme.shadow
                                : Globals.globalColorScheme.onError
                                    .withOpacity(0.12),
                            isGameMode2Selected
                                ? Globals.globalColorScheme.errorContainer
                                : Globals.globalColorScheme.onTertiary,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          createButton(
                            "Go!",
                            () {
                              Navigator.pushNamed(context, Globals.gamemodes);
                              Globals.player
                                  .play(AssetSource('audio/button.mp3'));
                              resetCardStates();
                            },
                            Globals.globalColorScheme.scrim,
                            Globals.globalColorScheme.outlineVariant,
                          ),
                          createButton(
                            "Back!",
                            () {
                              Navigator.pushNamed(context, '/landing');
                              Globals.player
                                  .play(AssetSource('audio/button.mp3'));
                            },
                            Globals.globalColorScheme.scrim,
                            Globals.globalColorScheme.outlineVariant,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
