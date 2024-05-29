import 'package:alphabetalternative/components/scoreboardcontainer.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';
import 'classic.dart';
import 'package:alphabetalternative/components/global.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int numberOfPlayers = Globals.numberOfPlayers;

  void clearMapLists(Map<int, List<String>> map) {
    map.forEach((key, value) {
      value.clear();
    });
  }

  void resetPlayerScores() {
    for (int player in playerScores.keys) {
      playerScores[player] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'LEADERBOARD',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                    ),
                  ),
                ),
                ...generatePlayerScoreboard(
                  numberOfPlayers: Globals.numberOfPlayers,
                  playerColors: playerColors,
                  playerBarWidth: 600,
                  playerTextColor: playerTextColors,
                ),
                createButton(
                  "Home!",
                  () {
                    clearMapLists(Globals.playerActionCards);
                    resetPlayerScores();
                    Globals.currentplayer = 1;

                    Navigator.pushNamed(context, '/landing');
                    Globals.player.play(AssetSource('audio/button.mp3'));
                  },
                  Globals.globalColorScheme.scrim,
                  Globals.globalColorScheme.outlineVariant,
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
