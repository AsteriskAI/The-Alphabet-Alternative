import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class LetterCard extends StatefulWidget {
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
  bool isFlipped = false;
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if (!isFlipped && !isMovingDown) {
          setState(() {
            isMovingDown = true;
          });

          Timer(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                isFlipped = true;
                isMovingDown = false;
              });

              widget.onCardClicked();
            }
          });
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        alignment: Alignment.center,
        transform: Matrix4.translationValues(
          0.0,
          isMovingDown ? 230.0 : 0.0,
          0.0,
        ),
        child: isFlipped
            ? Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 300,
                    child: SvgPicture.asset(
                      widget.backCardAsset,
                      width: 175,
                    ),
                  ),
                ],
              )
            : Transform.rotate(
                angle: widget.rotation,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      top: 30,
                      child: SvgPicture.asset(
                        widget.frontCardAsset,
                        width: 175,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


