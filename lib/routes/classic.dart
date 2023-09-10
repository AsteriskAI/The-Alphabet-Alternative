import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

class CardDeck extends StatefulWidget {
  final String frontCardAsset;
  final String backCardAsset;
  final double rotation;
  final bool isTopCard;

  CardDeck({
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.isTopCard,
  });

  @override
  _CardDeckState createState() => _CardDeckState();
}

class _CardDeckState extends State<CardDeck> {
  bool isFlipped = false;
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isFlipped) {
          setState(() {
            isMovingDown = true;
          });

          Timer(Duration(seconds: 1), () {
            setState(() {
              isFlipped = true;
              isMovingDown = false; 
            });
          });
        } else {
          setState(() {
            isMovingDown = true;
          });

        }
      },
      child: AnimatedContainer(
        duration: Duration(microseconds: 100),
        alignment: Alignment.center,
        transform: Matrix4.translationValues(
          0.0,
          isMovingDown ? 330.0 : 0.0, 
          0.0,
        ),
        child: isFlipped
            ? Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 450,
                    child: SvgPicture.asset(
                      widget.backCardAsset,
                      width: 200,
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
                      top: 120,
                      child: SvgPicture.asset(
                        widget.frontCardAsset,
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class ClassicMode extends StatefulWidget {
  ClassicMode({Key? key}) : super(key: key);

  @override
  _ClassicModeState createState() => _ClassicModeState();
}

class _ClassicModeState extends State<ClassicMode> {
  final CardDeckData cardDeckData = CardDeckData();
  List<int> shuffledIndexes = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    shuffledIndexes = List.generate(cardDeckData.frontCard.length, (index) => index);
    shuffledIndexes.shuffle(); // Shuffle the card indexes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          for (int i = 0; i < 6; i++)
            if (i + currentIndex >= 0 && i + currentIndex < cardDeckData.frontCard.length)
              CardDeck(
                frontCardAsset: cardDeckData.frontCard[shuffledIndexes[i + currentIndex]],
                backCardAsset: cardDeckData.backCard[shuffledIndexes[i + currentIndex]],
                rotation: (i == 0) ? 0.0 : (i < 3) ? 0.1 * i : -0.1 * (6 - i),
                isTopCard: (i == 0),
              ),
        ],
      ),
    );
  }
}

