import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/routes/classic.dart';
import 'package:alphabetalternative/components/button.dart';
import 'package:alphabetalternative/components/global.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int numberOfPlayers = Globals.numberOfPlayers; // Default number of players

  void resetScores() {
    for (int playerNumber in playerScores.keys) {
      playerScores[playerNumber] = 0;
    }
  }

  Text getWinnerMessage() {
  List<int> winners = [];
  int maxScore = playerScores.values.isNotEmpty
      ? playerScores.values.reduce((a, b) => a > b ? a : b)
      : 1;

  for (int playerNumber = 1; playerNumber <= numberOfPlayers; playerNumber++) {
    if (playerScores[playerNumber] == maxScore) {
      winners.add(playerNumber);
    }
  }

  if (winners.length == 1) {
    // Single winner
    return Text('Player ${winners[0]} wins!', style: const TextStyle(fontSize: 30, color: Color(0xff3463AF)), textAlign: TextAlign.center);
  } else if (winners.isNotEmpty) {
    // Tie between multiple players
    String tiePlayers = winners.map((playerNumber) => 'Player $playerNumber').join(' & ');
    return Text('Tie!\n $tiePlayers', style: const TextStyle(fontSize: 30, color: Color(0xff3463AF)), textAlign: TextAlign.center,);
  } else {
    return const Text('');
  }
}

@override
Widget build(BuildContext context) {
  int maxScore = playerScores.values.isNotEmpty
      ? playerScores.values.reduce((a, b) => a > b ? a : b)
      : 1;

  return SafeArea(
    child: Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int playerNumber = 1; playerNumber <= numberOfPlayers; playerNumber++)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          alignment: Alignment.bottomCenter,
                          width: MediaQuery.of(context).size.width / Globals.numberOfPlayers,
                          color: playerColors[playerNumber],
                          height: maxScore == 0
                              ? 0 // Handle division by zero when all players have 0 score
                              : ((playerScores[playerNumber]?.toDouble() ?? 0) / maxScore) *
                                  (MediaQuery.of(context).size.height * 0.65),
                          child:Text(
                              'Player $playerNumber\n''Score: ${playerScores[playerNumber]}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: playerTextColors[playerNumber] ?? Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                         const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              getWinnerMessage(),
              
              Align(
                alignment: Alignment.bottomCenter,
                child: createButton("Home", () {
                  Globals.player.play(AssetSource('audio/button.mp3'));
                  resetScores();
                  Globals.currentplayer = 1;
                  Navigator.pushNamed(context, '/landing');
                }, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}



}