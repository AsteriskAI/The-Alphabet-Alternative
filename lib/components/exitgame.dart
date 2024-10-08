import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class CustomPopupExit extends StatelessWidget {
  final Function()? onEndGame;
  final String text;

  const CustomPopupExit({Key? key, required this.text, this.onEndGame})
      : super(key: key);

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
                      Globals.player.play(AssetSource('audio/button.mp3'));
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
                      shape: WidgetStateProperty.all(const CircleBorder()),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xffE1292E)),
                      side: WidgetStateProperty.all(
                          const BorderSide(width: 1, color: Color(0xffC26B93))),
                    ),
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Globals.player.play(AssetSource('audio/button.mp3'));
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed('/scoreboard');
                    },
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
                      shape: WidgetStateProperty.all(const CircleBorder()),
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xff2B9E5D)),
                      side: WidgetStateProperty.all(
                          const BorderSide(width: 1, color: Color(0xffC26B93))),
                    ),
                    child:
                        const Icon(Icons.check, color: Colors.white, size: 30),
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
