import 'package:alphabetalternative/routes/classic.dart';
import 'package:alphabetalternative/routes/twist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LetterCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final String backcard;
  final double rotation;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  const LetterCard({super.key, 
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked, required this.backcard,
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
        if (!LetterCard.isDown && widget.backCardAsset == ClassicMode.clickabletopValue || widget.backCardAsset == TwistMode.clickabletopValue) {
          setState(() {
            LetterCard.isDown = true;
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
                    top: 42,
                    child: SvgPicture.asset(
                      widget.frontCardAsset,
                      width: 170,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}


