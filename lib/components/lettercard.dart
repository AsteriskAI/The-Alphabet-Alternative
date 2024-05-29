import 'package:alphabetalternative/routes/classic.dart';
import 'package:alphabetalternative/routes/discussive.dart';
import 'package:alphabetalternative/routes/twist.dart';
import 'package:audioplayers/audioplayers.dart';
import 'global.dart';
import 'package:flutter/material.dart';

class LetterCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final String backcard;
  final double rotation;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  const LetterCard({
    super.key,
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked,
    required this.backcard,
  });

  @override
  // ignore: library_private_types_in_public_api
  _LetterCardState createState() => _LetterCardState();
}

var topAsset = "";

class _LetterCardState extends State<LetterCard> {
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!LetterCard.isDown &&
                widget.backCardAsset == ClassicMode.clickabletopValue ||
            widget.backCardAsset == TwistMode.clickabletopValue ||
            widget.backCardAsset == DiscussiveMode.clickabletopValue) {
          setState(() {
            Globals.player.play(AssetSource('audio/card.mp3'));
            LetterCard.isDown = true;
          });
        }
      },
      child: LetterCard.isDown
          ? Stack(
              children: [
                Positioned(
                  left: 30,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 355 *
                        (3.14159265359 / 180), // Convert degrees to radians
                    child: Image.asset(
                      widget.backCardAsset,
                      width: 150,
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
                    left: 45,
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
