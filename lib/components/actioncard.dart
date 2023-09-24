import 'package:alphabetalternative/routes/classic.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/routes/twist.dart';
import 'dart:async';
import 'global.dart';

var topActionAsset = "";

class ActionCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final double rotation;
  final String backcard;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  const ActionCard({super.key, 
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked, required this.backcard,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ActionCardState createState() => _ActionCardState();
}

class _ActionCardState extends State<ActionCard> {
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!ActionCard.isDown && widget.backCardAsset == ClassicMode.clickabletopvalueaction || widget.backCardAsset == TwistMode.clickabletopvalueaction) {
          setState(() {
            Globals.player.play(AssetSource('audio/card.mp3'));
            ActionCard.isDown = true;
          });

          Timer(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                isMovingDown = false;
              });

            }
          });
        }
      },
      child: ActionCard.isDown
          ? Stack(
              children: [
                Positioned(
                  right: 30,
                  top: 250,
                  child: Transform.rotate(
                    angle: 5 * (3.14159265359 / 180), // Convert degrees to radians
                    child: Image.asset(
                      widget.backCardAsset,
                      width: 145,
                    ),
                  ),
                )
              ],
            )
          : Transform.rotate(
              angle: widget.rotation,
              child: Stack(
                children: [
                  Positioned(
                    right: 40,
                    top: 20,
                    child: Image.asset(
                      widget.frontCardAsset,
                      width: 125,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}



