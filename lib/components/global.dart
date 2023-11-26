import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alphabetalternative/color_schemes.g.dart';
import 'package:audioplayers/audioplayers.dart';

class Globals {
  static Map<int, String> tutorialMessages = {
    1: 'Welcome to the Alternative Alphabet, in this tutorial you will learn how to play this game with your friends and have a good time!',
    2: 'Player bars, they will keep track of your points as the game goes on.',
    3: 'Letter cards, they contain a word that corresponds with the letter.',
    4: 'Action cards, they contain tasks you are supposed to complete using the word in the letter card given, once completed you can add a point!',
    5: 'The Proceed button, once the task is done or the player gives up, click on it to show a popup.',
    6: 'Once clicked on the proceed button, a pop up will appear which includes the definitions and alternative words for the word on the letter card, as well as 2 buttons to add a point or not.',
    7: 'As you proceed to the next player, the cards are reshuffled each time to ensure diversity each game!',
    8: 'Once you want to end the game, simply click on the end game button and on the tick mark to end the game. The Twist gamemode is the same with an addition of 2 new types of action cards.'
  };
  static AudioPlayer player = AudioPlayer();
  static int currentTutorialStep = 1;
  static int currentplayer = 1;
  static String cardclicked = '';
  static int numberOfPlayers = 2;
  static String topactioncard = '';
  static bool point = false;
  static String gamemodefr = '/classic';
  static String gamemodes = '/selection';
  static Map<int, String> playerName = {
    1: 'Player 1',
    2: 'Player 2',
    3: 'Player 3',
    4: 'Player 4',
    5: 'Player 5',
    6: 'Player 6',
  };

static Map<int, List<String>> playerActionCards = {
  1: [],
  2: [],
  3: [],
  4: [],
  5: [],
  6: [],
};

  static const name = '';

  static const ColorScheme globalColorScheme = ColorSchemes;
  static final ruleimage = Image.asset(
    'assets/rule.png',
    height: 350,
    width: 300,
    alignment: Alignment.topCenter,
  );
  static final logoImage = SvgPicture.asset(
    'assets/logo.svg',
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.contain,
    alignment: Alignment.topCenter,
  );
}
