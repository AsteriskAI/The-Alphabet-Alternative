import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:alphabetalternative/components/lettercard.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/button.dart';

class SelectGameMode extends StatefulWidget {
  const SelectGameMode({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectGameModeState createState() => _SelectGameModeState();
}

class _SelectGameModeState extends State<SelectGameMode> {


  void resetCardStates() {
    setState(() {
      ActionCard.isDown = false;
      LetterCard.isDown = false;
    });
  }

  void updatePlayerName(int playerIndex, String newName) {
    setState(() {
      Globals.playerName[playerIndex] = newName;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Select GameMode',
                  style: TextStyle(
                    color: Globals.globalColorScheme.tertiary,
                    fontSize: 26,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  createButton(
                    "GameMode 1",
                    () {
                        Globals.player.play(AssetSource('audio/button.mp3'));
                        resetCardStates();
                      
                    },
                    const Color(0xfffabca7),
                    const Color.fromARGB(255, 250, 104, 56)
                  ),
                  createButton(
                        "GameMode 2",
                        () {
                          Globals.player
                              .play(AssetSource('audio/button.mp3'));
                        },
                        const Color(0xffffcfe4),
                        const Color(0xffED1E91),
                      ),
                  createButton(
                        "GameMode 3",
                        () {
                          Globals.player
                              .play(AssetSource('audio/button.mp3'));
                        },
                        const Color(0xff59C787),
                        const Color.fromARGB(255, 0, 117, 51),
                      ),
                  createButton(
                        "GameMode 4",
                        () {
                          Globals.player
                              .play(AssetSource('audio/button.mp3'));
                        },
                        const Color(0xffd884d9),
                        const Color(0xff9f3b95),
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
    );
  }
}


Map<int, Color> playerColors = {
  1: const Color(0xfffabca7),
  2: const Color(0xffffcfe4),
  3: const Color(0xff59C787),
  4: const Color(0xfffcd89d),
  5: const Color(0xffd884d9),
  6: const Color(0xffee6c7f)
};
Map<int, Color> playerTextColors = {
  1: const Color.fromARGB(255, 250, 104, 56),
  2: const Color(0xffED1E91),
  3: const Color.fromARGB(255, 0, 117, 51),
  4: const Color(0xfff8a41b),
  5: const Color(0xff9f3b95),
  6: const Color(0xffbd253c)
};