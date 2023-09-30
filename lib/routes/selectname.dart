import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/components/namecontainer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:alphabetalternative/components/lettercard.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/button.dart';

class SelectName extends StatefulWidget {
  const SelectName({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectNameState createState() => _SelectNameState();
}

class _SelectNameState extends State<SelectName> {


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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Enter all player names',
                    style: TextStyle(
                      color: Globals.globalColorScheme.tertiary,
                      fontSize: 26,
                    ),
                  ),
                ),
                ...generatePlayerNames(
                  numberOfPlayers: Globals.numberOfPlayers,
                  playerColors: playerColors,
                  playerBarWidth: 300,
                  playerTextColor: playerTextColors,
                  playerName: Globals.playerName,
                  onNameChanged: updatePlayerName,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton(
                      "Proceed!",
                      () {
                          Navigator.pushNamed(context, Globals.gamemodefr);
                          Globals.player.play(AssetSource('audio/button.mp3'));
                          resetCardStates();
                        
                      },
                      Globals.globalColorScheme.scrim,
                      Globals.globalColorScheme.outlineVariant
                    ),
                    createButton(
                          "Back!",
                          () {
                            Navigator.pushNamed(context, '/selection');
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