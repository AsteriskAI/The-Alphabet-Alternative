import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/tutorialactioncard.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/components/tutoriallettercard.dart';
import 'package:alphabetalternative/components/button.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/tutorialpopup.dart';
import 'package:alphabetalternative/components/player_bar.dart';



class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TutorialState createState() => _TutorialState();
  static String get clickabletopValue => clickabletop;
  static String get clickabletopvalueaction => clickabletopaction;
}



String topcard = "";

String drums(String currenttopcard,) {
  topcard = currenttopcard;
  return(topcard);
}

String clickabletop = '';
  String coldplay(String currentclickabletop,) {
  clickabletop = currentclickabletop;
  return(clickabletop);
}

String clickabletopaction = '';
  String coldplayaction(String currentclickabletop,) {
  clickabletopaction = currentclickabletop;
  return(clickabletopaction);
}

class _TutorialState extends State<Tutorial> {
  final CardDeckData cardDeckData = CardDeckData();
  List<int> shuffledIndexes = [];
  int tutorialplayers = 3;
  List<int> shuffledActionIndexes = [];
  int currentIndex = 0;
  int actionCardIndex = 0;
  List<String> actionCards = List.filled(25, '');
  bool cardsClickable = true;

  



  Map<String, String> letterPopupText = {
    'assets/words/P word.svg': 'P is for Positive.\nDefinition: Constructive, optimistic, or confident.\nAlternatives: Personality, Pride, Practice.',
  };

  @override
  void initState() {
    super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return TutorialPopup(
              text: Globals.tutorialMessages[Globals.currentTutorialStep].toString(),
            );
          },
        );
  });
  shuffledIndexes = List.generate(cardDeckData.frontCard.length, (index) => index);
    shuffleActionCards();
  } 
  
  void shuffleLetterCards() {
    shuffledIndexes.shuffle();
    setState(() {
    });
  }

  void shuffleActionCards() {
    final List<int> actionCardIndexes = List.generate(classicactions.length, (index) => index);
    actionCardIndexes.shuffle();

    setState(() {
      actionCardIndex = 0;
      shuffledActionIndexes = List.from(actionCardIndexes);
      for (int i = 0; i < 25; i++) {
        actionCards[i] = cardDeckData.frontActionCard[actionCardIndexes[i]];
        cardDeckData.backActionCard[i] = cardDeckData.backActionCard[actionCardIndexes[i]];
      }
    });
  }



  String _addDescToFilename(String frontCardAsset) {
    int dotIndex = frontCardAsset.lastIndexOf('.');
    String filenameWithoutExtension = frontCardAsset.substring(0, dotIndex);
    String fileExtension = frontCardAsset.substring(dotIndex);
    String backCardAsset = '$filenameWithoutExtension desc$fileExtension';
    return backCardAsset;
  }
  


  String _addWordToFilename(String frontCardAsset) {
    int dotIndex = frontCardAsset.lastIndexOf('.');
    String filenameWithoutExtension = frontCardAsset.substring(0, dotIndex);
    String fileExtension = frontCardAsset.substring(dotIndex);
    String backCardAsset = '$filenameWithoutExtension word$fileExtension';
    return backCardAsset;
  }

  @override
  Widget build(BuildContext context) {
    final playerBarWidth = MediaQuery.of(context).size.width / tutorialplayers;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Stack(
          children: [
            
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: generatePlayerBars(
                    playerTextColor: playerTextColors,
                    numberOfPlayers: tutorialplayers,
                    playerColors: playerColors,
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
                        if (i + currentIndex >= 0 &&
                            i + currentIndex < cardDeckData.frontCard.length) 
    
                          TutorialLetterCard(
                            //bookmark
                            backcard: coldplay(_addWordToFilename(cardDeckData.frontCard[shuffledIndexes[i + currentIndex]])),
                            frontCardAsset: cardDeckData.frontCard[shuffledIndexes[i + currentIndex]],
                            backCardAsset: drums(_addWordToFilename(cardDeckData.frontCard[shuffledIndexes[25]])),
                            rotation: (i == 0) ? 0.0 : (i < 2) ? 0.01 * i : -0.01 * (3 - i),
                            currentPlayer: Globals.currentplayer,
                            playerNumber: i + 1,
                            onCardClicked: () {
                              if (cardsClickable) {
                                setState(() {
                                cardsClickable = false;
                                shuffleActionCards();
                                });
                              }
                            },
                          ),
                      for (int i = 0; i < 25; i++)
                        if (i + actionCardIndex >= 0 &&
                            i + actionCardIndex < actionCards.length)
                          TutorialActionCard(
                            backcard: coldplayaction(_addDescToFilename(actionCards[shuffledActionIndexes[i + actionCardIndex]])),
                            frontCardAsset: actionCards[shuffledActionIndexes[i + actionCardIndex]],
                            backCardAsset: _addDescToFilename(actionCards[shuffledActionIndexes[24]]),
                            rotation: (i == 0) ? 0.0 : (i < 2) ? 0.01 * i : -0.01 * (3 - i),
                            currentPlayer: Globals.currentplayer,
                            playerNumber: i + 1,
                            onCardClicked: () {
                              if (cardsClickable) {
                                cardsClickable = false;
                                shuffleActionCards();
                              }
                            },
                          ),
                    ],
                  ),
                ),
                Row(
      mainAxisAlignment: MainAxisAlignment.end, 
      children: [
      Expanded(
            flex: 1,
            child: createButton('Proceed', () {
            }, const Color(0xffFFD590), const Color(0xffF9A51B)),
      ),
      Expanded(flex: 1,child: createButton('End Game', () {
      }, const Color(0xffFFD590), const Color(0xffF9A51B))),
      ],
    )
    
    
    
    
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Map<int, Color> playerColors = {
  1: const Color(0xffEAB29C),
  2: const Color(0xffF4A3C8),
  3: const Color(0xff59C787),
  4: const Color(0xffffd366),
  5: const Color(0xffd884d9),
  6: const Color(0xffee6c7f)
};
Map<int, Color> playerTextColors = {
  1: const Color(0xffF68D68),
  2: const Color(0xffED1E91),
  3: const Color(0xff2B9E5D),
  4: const Color(0xffe5ad21),
  5: const Color(0xff9f3b95),
  6: const Color(0xffbd253c)
};

 Map<int, int> playerScores = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
  };