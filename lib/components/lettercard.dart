import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class LetterCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final double rotation;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  LetterCard({
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked,
  });

  @override
  _LetterCardState createState() => _LetterCardState();
}

class _LetterCardState extends State<LetterCard> {
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!LetterCard.isDown) {
          setState(() {
            LetterCard.isDown = true;
          });

          Timer(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                isMovingDown = false;
              });

            }
          });
        }
      },
      child: LetterCard.isDown
          ? Stack(
              children: [
                Positioned(
                  left: 30,
                  top: 270,
                  child: Transform.rotate(
                    angle: 355 * (3.14159265359 / 180), // Convert degrees to radians
                    child: SvgPicture.asset(
                      widget.backCardAsset,
                      width: 170,
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
                    left: 10,
                    top: 40,
                    child: SvgPicture.asset(
                      widget.frontCardAsset,
                      width: 165,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}



