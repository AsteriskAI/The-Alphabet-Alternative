import 'package:alphabetalternative/routes/classic.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/routes/twist.dart';
import 'dart:async';

var topActionAsset = "";

class TutorialActionCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final double rotation;
  final String backcard;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  const TutorialActionCard({super.key, 
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked, required this.backcard,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TutorialActionCardState createState() => _TutorialActionCardState();
}

class _TutorialActionCardState extends State<TutorialActionCard> {
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!TutorialActionCard.isDown && widget.backCardAsset == ClassicMode.clickabletopvalueaction || widget.backCardAsset == TwistMode.clickabletopvalueaction) {
          setState(() {
            TutorialActionCard.isDown = true;
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
      child:  Stack(
              children: [
                Positioned(
                  right: 30,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 5 * (3.14159265359 / 180), // Convert degrees to radians
                    child: Image.asset(
                      widget.backCardAsset,
                      width: 150,
                    ),
                  ),
                ),
              Transform.rotate(
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
              ],
            )
    );
  }
}



