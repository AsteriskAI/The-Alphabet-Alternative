import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/player_bar.dart';
import 'package:alphabetalternative/components/lettercard.dart';

class ClassicMode extends StatefulWidget {
  ClassicMode({Key? key}) : super(key: key);

  @override
  _ClassicModeState createState() => _ClassicModeState();
}

class _ClassicModeState extends State<ClassicMode> {
  final CardDeckData cardDeckData = CardDeckData();
  List<int> shuffledIndexes = [];
  int currentIndex = 0;
  int actionCardIndex = 0;
  int numberOfPlayers = 3;
  int currentPlayer = 1;
  List<String> actionCards = List.filled(6, '');

  @override
  void initState() {
    super.initState();
    shuffledIndexes = List.generate(cardDeckData.frontCard.length, (index) => index);
    shuffledIndexes.shuffle();
    actionCards = List.filled(6, '');
    shuffleActionCards();
  }

  void shuffleActionCards() {
    final actionCardIndexes = List.generate(cardDeckData.frontActionCard.length, (index) => index);
    actionCardIndexes.shuffle();

    for (int i = 0; i < 6; i++) {
      actionCards[i] = cardDeckData.frontActionCard[actionCardIndexes[i]];
    }
  }



  void switchToNextPlayer() {
    setState(() {
      currentPlayer = (currentPlayer % numberOfPlayers) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerBarWidth = MediaQuery.of(context).size.width / numberOfPlayers;

    return Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: generatePlayerBars(
              playerTextColor: playerTextColors,
              numberOfPlayers: numberOfPlayers,
              playerColors: playerColors,
              currentPlayer: currentPlayer,
              playerBarWidth: playerBarWidth - 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: RichText(
              text: const TextSpan(
                text: 'Draw a letter ',
                style: TextStyle(
                  fontFamily: 'Bauhaus',
                  color: Color(0xff2B9E5D),
                  fontSize: 20,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'then an action card',
                    style: TextStyle(
                      fontFamily: 'Bauhaus',
                      color: Color(0xff3463AF),
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                for (int i = 0; i < 26; i++)
                  if (i + currentIndex >= 0 && i + currentIndex < cardDeckData.frontCard.length)
                    LetterCard(
                      frontCardAsset: cardDeckData.frontCard[shuffledIndexes[i + currentIndex]],
                      backCardAsset: cardDeckData.backCard[shuffledIndexes[i + currentIndex]],
                      rotation: (i == 0) ? 0.0 : (i < 2) ? 0.01 * i : -0.01 * (3 - i),
                      currentPlayer: currentPlayer,
                      playerNumber: i + 1,
                      onCardClicked: () {
                        switchToNextPlayer();
                      },
                    ),
                for (int i = 0; i < 25; i++)
                  if (i + actionCardIndex >= 0 && i + actionCardIndex < actionCards.length)
                    ActionCard(
                      frontCardAsset: actionCards[i + actionCardIndex],
                      backCardAsset: cardDeckData.frontActionCard[i + actionCardIndex],
                      rotation: (i == 0) ? 0.0 : (i < 2) ? 0.01 * i : -0.01 * (3 - i),
                      currentPlayer: currentPlayer,
                      playerNumber: i + 1,
                      onCardClicked: () {
                        
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Map<int, Color> playerColors = {
  1: Color(0xffEAB29C),
  2: Color(0xffF4A3C8),
  3: Color(0xff59C787),
  4: Color(0xffe5ad21),
  5: Color(0xff9f3b95),
  6: Color(0xffbd253c)
};
Map<int, Color> playerTextColors = {
  1: Color(0xffF68D68),
  2: Color(0xffED1E91),
  3: Color(0xff2B9E5D),
  4: Color(0xffffd366),
  5: Color(0xffd884d9),
  6: Color(0xffee6c7f)
};
