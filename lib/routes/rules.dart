import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';

class RulePage extends StatelessWidget {
  const RulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Globals.ruleimage,

          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0, top: 16.0, bottom: 16.0),
              child:  const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      ],
                    ),
                  Text(
                    'Objective:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3463AF)), // Text color
                  ),
                  Text(
                    'The goal of the game is to collect all the Action Cards by successfully completing the tasks associated with each Word Card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Text color
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0, top: 16.0, bottom: 16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Items:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '26 Word Cards\n'
                    '25 Action Cards\n'
                    '35 Action Cards (Twist Mode)',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0, top: 16.0, bottom: 16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gameplay:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '1. Shuffle the deck of 26 Word Cards and place them face down in a pile.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '2. Shuffle the deck of Action Cards and place them face down in a separate pile.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '3. The first player draws an Action Card and a Word Card. The Action Card determines the task that must be completed with the corresponding Word Card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '4. The player must complete the task named on the Action Card using the word on the Word Card. For example, if the Action Card is a Define Card and the Word Card is "A" for Anxiety, the player must try to define what anxiety means.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '5. If the player successfully completes the task, they keep the Action Card as a point and place the Word Card back in the pile of Word Cards. If they are unable to complete the task, require assistance from the Game Master, or want to Pass, they return both cards to the bottom of their respective piles.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '6. Play continues clockwise with each player taking turns drawing an Action Card and a Word Card and completing the associated task.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '7. The game ends when all the Action Cards have been collected. The player with the most Action Cards at the end of the game wins.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '8. In case two players have an equal number of Action Cards at the end of the game, the player with the largest variety of Action Cards wins.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0, top: 16.0, bottom: 16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action Cards:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '1. Define Card: Define the word on your card as accurately as you can.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '2. Ask A Question Card: Ask the Game Master a question you or another person might have about the word on your card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '3. Draw Card: Draw a representation of the word on your card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '4. Alternative Card: Offer an alternative word related to mental health and well-being using the same letter on your card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  Text(
                    '5. Reflect Card: Reflect on how your word can positively or negatively affect someone\'s life.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(left: 40.0, right: 30.0, top: 16.0, bottom: 16.0),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Twist Mode Additions:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF3463AF)), // Header color
                  ),
                  const Text(
                    'Goalsetting Card: Create a mental health goal that you aim to achieve, focusing on self-improvement and personal growth.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                  const Text(
                    'Storytelling Card: Share a personal or fictional story related to the word on your alphabet card.',
                    style: TextStyle(fontSize: 16, color: Color(0xFF3463AF)), // Header color
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        createButton("Back!", () {Navigator.pushNamed(context, '/landing');  }, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
                      ],
                    ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
