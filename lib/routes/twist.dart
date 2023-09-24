import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/actioncard.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/components/button.dart';
import 'package:alphabetalternative/components/exitgame.dart';
import 'package:alphabetalternative/components/popup.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/player_bar.dart';
import 'package:alphabetalternative/components/lettercard.dart';



class TwistMode extends StatefulWidget {
  const TwistMode({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TwistModeState createState() => _TwistModeState();
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

class _TwistModeState extends State<TwistMode> {
  final CardDeckData cardDeckData = CardDeckData();
  List<int> shuffledIndexes = [];
  List<int> shuffledActionIndexes = [];
  int currentIndex = 0;
  int actionCardIndex = 0;
  List<String> actionCards = List.filled(35, '');
  bool cardsClickable = true;
  
  Map<String, String> letterPopupText = {
    'assets/words/A word.svg': 'A is for Anxiety.\nDefinition: A state of uneasiness and worry often accompanied by nervousness and fear.\nAlternatives: Apprehension, Angst, Anguish.',
    'assets/words/B word.svg': 'B is for Belonging.\nDefinition: The sense of being accepted and valued within a particular group, community, or society.\nAlternatives: Bonding, Belief, Brotherhood.',
    'assets/words/C word.svg': 'C is for Courage.\nDefinition: The ability to confront fear, pain, danger, or uncertainty with confidence and determination.\nAlternatives: Conviction, Confidence, Composure.',
    'assets/words/D word.svg': 'D is for Different.\nDefinition: Uncommon or distinct from what is considered ordinary or typical.\nAlternatives: Disposition, Distinctiveness, Disparate.',
    'assets/words/E word.svg': 'E is for Expectations.\nDefinition: Anticipations of future events or outcomes, often accompanied by hopes and fears.\nAlternatives: Excitement, Enthusiasm, Elevation.',
    'assets/words/F word.svg': 'F is for Friends.\nDefinition: Companions with whom one shares affection, trust, and mutual support.\nNone.',
    'assets/words/G word.svg': 'G is for Gratitude.\nDefinition: The feeling of being thankful and appreciative for the good things in life.\nAlternatives: Grace, Grief, Guidance.',
    'assets/words/H word.svg': 'H is for Hopelessness.\nDefinition: A state of despair or belief that nothing positive will occur.\nAlternatives: Hope, Health, Humor.',
    'assets/words/I word.svg': 'I is for Insecurity.\nDefinition: A lack of self-confidence or assurance, often leading to self-doubt.\nAlternatives: Independence, Instability, Inadequacy.',
    'assets/words/J word.svg': 'J is for Joy.\nDefinition: A feeling of great happiness, contentment, or delight.\nAlternatives: Jubilation, Judgement.',
    'assets/words/K word.svg': 'K is for Kindness.\nDefinition: The quality of being considerate, friendly, and compassionate towards others.\nAlternatives: Karma, Keeping a journal.',
    'assets/words/L word.svg': 'L is for Loneliness.\nDefinition: A state of isolation and emotional emptiness due to a lack of companionship.\nAlternatives: Life-long learning, Love, Laughter.',
    'assets/words/M word.svg': 'M is for Mindfulness.\nDefinition: The practice of being fully aware and present in the moment, without judgment.\nAlternatives: Mood, Motivation, Meditation.',
    'assets/words/N word.svg': 'N is for Negativity.\nDefinition: An attitude in which one only considers the bad qualities of someone or something.\nAlternatives: Nervous, Neglect, Need.',
    'assets/words/O word.svg': 'O is for Openness.\nDefinition: Allowing oneself to be vulnerable, express feelings, and engage in honest and authentic communication.\nAlternatives: Overwhelmed, Obsessive, Ominous.',
    'assets/words/P word.svg': 'P is for Positive.\nDefinition: Constructive, optimistic, or confident.\nAlternatives: Personality, Pride, Practice.',
    'assets/words/Q word.svg': 'Q is for Questioning.\nDefinition: Expressing thoughts or doubts about the truth of something, showing you want an answer about something.\nAlternatives: Quiet, Qualities, Quirky.',
    'assets/words/R word.svg': 'R is for Rejection.\nDefinition: Experiencing emotional distress or pain due to the perception of being unwanted, excluded, or unaccepted by others.\nAlternatives: Reflection, Regret, Relief.',
    'assets/words/S word.svg': 'S is for Self-compassion.\nDefinition: Being warm and understanding towards ourselves when we suffer, fail, or feel inadequate.\nAlternatives: Stress, Stretched, Support.',
    'assets/words/T word.svg': 'T is for Tolerance.\nDefinition: The acceptance and respect of differences, beliefs, or behaviors that may differ from one\'s own.\nAlternatives: Trust, Tired, Thoughtful.',
    'assets/words/U word.svg': 'U is for Understanding.\nDefinition: Being sympathetically aware of other people\'s feelings; being tolerant and forgiving.\nAlternatives: Upset, Uncertainty, Undervalued.',
    'assets/words/V word.svg': 'V is for Vulnerability.\nDefinition: A willingness to show emotion or allowing one\'s weaknesses to be seen or known.\nAlternatives: Value, Vision, Validation.',
    'assets/words/W word.svg': 'W is for Wellbeing.\nDefinition: A combination of a person\'s physical, mental, emotional, and social health factors.\nAlternatives: Worth, Worry, Woke.',
    'assets/words/X word.svg': 'X is for Xenophobia.\nDefinition: The presence of fear, prejudice, or hostility towards people from other countries or cultures.\nAlternatives: None.',
    'assets/words/Y word.svg': 'Y is for You.\nDefinition: Mental health starts from within, me/myself.\nAlternatives: Yearning, Yoga, Youth.',
    'assets/words/Z word.svg': 'Z is for Zzzz (Sleep).\nDefinition: A vital function for overall wellbeing, physical health, cognitive function, and emotional balance.\nAlternatives: Zen, Zest, Zoning out.',
  };

  @override
  void initState() {
    super.initState();

    shuffledIndexes = List.generate(cardDeckData.frontCard.length, (index) => index);
    shuffleActionCards();
  }

  void shuffleLetterCards() {
    shuffledIndexes.shuffle();
    setState(() {
    });
  }

  void shuffleActionCards() {
    final List<int> actionCardIndexes = List.generate(twistactions.length, (index) => index);
    actionCardIndexes.shuffle();

    setState(() {
      actionCardIndex = 0;
      shuffledActionIndexes = List.from(actionCardIndexes);
      for (int i = 0; i < 35; i++) {
        actionCards[i] = cardDeckData.frontTwistActionCard[actionCardIndexes[i]];
        cardDeckData.backTwistActionCard[i] = cardDeckData.backTwistActionCard[actionCardIndexes[i]];
      }
    });
  }

  void switchToNextPlayer() {
    setState(() {
      Globals.currentplayer = (Globals.currentplayer % Globals.numberOfPlayers) + 1;
    });
  }

  void proceedToNextTurn() {
    setState(() {
      cardsClickable = true;
      LetterCard.isDown = false;
      ActionCard.isDown = false;
      Globals.currentplayer = (Globals.currentplayer % Globals.numberOfPlayers) + 1;
      shuffleLetterCards();
      shuffleActionCards();
      currentIndex = 0;
      actionCardIndex = 0;
      cardsClickable = true;
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
    final playerBarWidth = MediaQuery.of(context).size.width / Globals.numberOfPlayers;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: generatePlayerBars(
                playerTextColor: playerTextColors,
                numberOfPlayers: Globals.numberOfPlayers,
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
                        
                      LetterCard(
                        //bookmark
                        backcard: coldplay(_addWordToFilename(cardDeckData.frontCard[shuffledIndexes[i + currentIndex]])),
                        frontCardAsset: cardDeckData.frontCard[shuffledIndexes[i + currentIndex]],
                        backCardAsset: drums(_addWordToFilename(cardDeckData.frontCard[shuffledIndexes[i + currentIndex]])),
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
                  for (int i = 0; i < 35; i++)
                    if (i + actionCardIndex >= 0 &&
                        i + actionCardIndex < actionCards.length)
                      ActionCard(
                        backcard: coldplayaction(_addDescToFilename(actionCards[shuffledActionIndexes[i + actionCardIndex]])),
                        frontCardAsset: actionCards[shuffledActionIndexes[i + actionCardIndex]],
                        backCardAsset: _addDescToFilename(actionCards[shuffledActionIndexes[i + actionCardIndex]]),
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
          Globals.player.play(AssetSource('audio/button.mp3'));
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomPopup(
                text: letterPopupText[topcard] ?? 'Text not found',
                onProceed: proceedToNextTurn,
              );
            },
          );
        }, const Color(0xffFFD590), const Color(0xffF9A51B)),
      ),
      Expanded(flex: 1,child: createButton('End Game', () {
        Globals.player.play(AssetSource('audio/button.mp3'));
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomPopupExit(
                text: 'Are you sure you want to exit this game?',
              );
            },
          );
      }, const Color(0xffFFD590), const Color(0xffF9A51B))),
      ],
    )
    
    
    
    
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