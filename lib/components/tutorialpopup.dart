import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class TutorialPopup extends StatefulWidget {
  final Function()? onProceed;
  final String text;

  const TutorialPopup({Key? key, required this.text, this.onProceed}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TutorialPopupState createState() => _TutorialPopupState();
}

class _TutorialPopupState extends State<TutorialPopup> {
  late int randomIndex;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
            right: 16,
            bottom: 16,
          ),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'Mooli',
                    fontSize: 24,
                    color: Color(0xff3463AF),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Globals.player.play(AssetSource('audio/button.mp3'));
                            Navigator.of(context).pop();
                            if (Globals.currentTutorialStep > 1) {
                              Globals.currentTutorialStep--;
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TutorialPopup(
                                  text: Globals.tutorialMessages[Globals.currentTutorialStep].toString(),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                            shape: MaterialStateProperty.all(const CircleBorder()),
                            backgroundColor: MaterialStateProperty.all(const Color(0xff3463AF)),
                            side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xff3463AF))),
                          ),
                          child: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                        ),
                        Text('${Globals.currentTutorialStep}/8', style: const TextStyle(color: Color(0xff3463AF))),
                        ElevatedButton(
                          onPressed: () {
                            Globals.player.play(AssetSource('audio/button.mp3'));
                            Navigator.of(context).pop();
                            if (Globals.currentTutorialStep < 8) {
                              Globals.currentTutorialStep++;
                            }
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TutorialPopup(
                                  text: Globals.tutorialMessages[Globals.currentTutorialStep].toString(),
                                );
                              },
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                            shape: MaterialStateProperty.all(const CircleBorder()),
                            backgroundColor: MaterialStateProperty.all(const Color(0xff3463AF)),
                            side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xff3463AF))),
                          ),
                          child: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                      if (Globals.currentTutorialStep == 8) 
                      createButton("Let's Go!", () {Navigator.pushNamed(context, '/selection');Globals.player.play(AssetSource('audio/button.mp3'));}, const Color(0xff3463AF), Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
