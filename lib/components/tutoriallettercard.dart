import 'package:alphabetalternative/routes/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TutorialLetterCard extends StatefulWidget {
  static bool isDown = false;
  final String frontCardAsset;
  final String backCardAsset;
  final String backcard;
  final double rotation;
  final int currentPlayer;
  final int playerNumber;
  final VoidCallback onCardClicked;

  const TutorialLetterCard({super.key, 
    required this.frontCardAsset,
    required this.backCardAsset,
    required this.rotation,
    required this.currentPlayer,
    required this.playerNumber,
    required this.onCardClicked, required this.backcard,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TutorialLetterCardState createState() => _TutorialLetterCardState();
}
var topAsset = "";
class _TutorialLetterCardState extends State<TutorialLetterCard> {
  bool isMovingDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!TutorialLetterCard.isDown && widget.backCardAsset == Tutorial.clickabletopValue ) {
          setState(() {
            TutorialLetterCard.isDown = true;
          });
        }
      },
      child: Stack(
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
                ),
              Transform.rotate(
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
              ],
            )
    );
  }
}


