import 'package:alphabetalternative/color_schemes.g.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/lettercard.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/slider.dart';
import 'package:alphabetalternative/components/button.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool isGameMode1Selected = true;
  String gamemode = '';
  CardDeckData cardDeckData = CardDeckData();
  bool isGameMode2Selected = true;
  bool isGameMode3Selected = true;

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
      gamemode = '/classic';
    } else if (isGameMode2Selected) {
      gamemode = '/twist';
    } else if (isGameMode3Selected) {
      gamemode = '/discussive';
    }
    Globals.gamemodefr = gamemode;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Stack(
          children: [
            Globals.logoImage,
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Players',
                      style: TextStyle(
                        color: Globals.globalColorScheme.tertiary,
                        fontSize: 26,
                      ),
                    ),
                    const MySlider(),
                    Text(
                      'Game Mode',
                      style: TextStyle(
                        color: Globals.globalColorScheme.tertiary,
                        fontSize: 26,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createButton(
                          'Classic',
                          () {
                            setState(() {
                              isGameMode1Selected = true;
                              isGameMode3Selected = false;
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
                          'Twist',
                          () {
                            setState(() {
                              isGameMode2Selected = true;
                              isGameMode1Selected = false;
                              isGameMode3Selected = false;
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
                          'Insights',
                          () {
                            setState(() {
                              isGameMode1Selected = false;
                              isGameMode2Selected = false;
                              isGameMode3Selected = true;
                            });
                          },
                          isGameMode3Selected
                              ? const Color(0xffee6c7f)
                              : Globals.globalColorScheme.onError
                                  .withOpacity(0.12),
                          isGameMode3Selected
                              ? const Color(0xffbd253c)
                              : Globals.globalColorScheme.onTertiary,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createButton(
                          "Next!",
                          () {
                            Navigator.pushNamed(context, '/name');
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
                            Navigator.pushNamed(context, '/mode');
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
          ],
        ),
      ),
    );
  }
}
