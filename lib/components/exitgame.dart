import 'package:flutter/material.dart';
import 'package:alphabetalternative/routes/classic.dart';
import 'global.dart';

class CustomPopupExit extends StatelessWidget {
  final Function()? onEndGame;
  final String text;

  void resetScores() {
  for (int playerNumber in playerScores.keys) {
    playerScores[playerNumber] = 0;
  }
}

  const CustomPopupExit({Key? key, required this.text, this.onEndGame}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xff93D5DA),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  color: Color(0xff3463AF),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(const Color(0xffE1292E)),
                      side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xffC26B93))),
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                      Navigator.of(context).pushNamed('/landing');
                      resetScores();
                      Globals.currentplayer = 1;
                      Globals.numberOfPlayers = 2;
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      backgroundColor: MaterialStateProperty.all(const Color(0xff2B9E5D)),
                      side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xffC26B93))),
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
