import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'messagepopup.dart';
import 'dart:math';
import 'package:alphabetalternative/routes/classic.dart';




class CustomPopup extends StatefulWidget {
  final Function()? onProceed;
  final String text;
  

  const CustomPopup({Key? key, required this.text, this.onProceed}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomPopupState createState() => _CustomPopupState();
}

class _CustomPopupState extends State<CustomPopup> {
  late int randomIndex;
  late List<String> shuffledPointMessages;
  late List<String> shuffledNoPointMessages; 

  @override
  void initState() {
    super.initState();
    randomIndex = Random().nextInt(popupbgcolor.length) + 1;
    shuffledPointMessages = shuffleMessages(pointmessage);
    shuffledPointMessages = shuffleMessages(nopointmessage);
  }



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

  void _updateRandomIndex() {
    setState(() {
      randomIndex = Random().nextInt(popupbgcolor.length) + 1;
    });
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
            color: popupbgcolor[randomIndex], // Use the random background color
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
                widget.text,
                style: TextStyle(
                  fontFamily: 'Mooli',
                  fontSize: 24,
                  color: popuptextcolor[randomIndex], // Use the matching text color
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Globals.player.play(AssetSource('audio/button.mp3'));
                        Navigator.of(context).pop();
                        if (widget.onProceed != null) {
                          widget.onProceed!();
                        }
                        _updateRandomIndex(); 
                        shuffledNoPointMessages = shuffleMessages(nopointmessage);
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: MessagePopup(
                              backgroundColor: popupbgcolor[randomIndex],
                              textColor: popuptextcolor[randomIndex],
                              text: shuffledNoPointMessages[0],
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      );
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(const Color(0xffE1292E)),
                        side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xffC26B93))),
                      ),
                      child: const Icon(Icons.remove, color: Colors.white, size: 30),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Globals.player.play(AssetSource('audio/pointup.mp3'));
                        setState(() {
                          playerScores[Globals.currentplayer] = playerScores[Globals.currentplayer]! + 1;
                          Globals.playerActionCards[Globals.currentplayer]?.add(Globals.topactioncard);
                        });
                        Navigator.of(context).pop();
                        if (widget.onProceed != null) {
                          widget.onProceed!();
                        }
                        _updateRandomIndex();
                        Globals.point = true;
                        shuffledPointMessages = shuffleMessages(pointmessage);
                        showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Stack(
                            children: [
                              MessagePopup(
                                backgroundColor: popupbgcolor[randomIndex],
                                textColor: popuptextcolor[randomIndex],
                                text: shuffledPointMessages[0],
                                duration: const Duration(seconds: 1),
                              ),],
                          );
                        },
                      );
                      
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                        backgroundColor: MaterialStateProperty.all(const Color(0xff2B9E5D)),
                        side: MaterialStateProperty.all(const BorderSide(width: 1, color: Color(0xffC26B93))),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 30),
                    ),
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


Map<int, Color> popupbgcolor = {
  1: const Color(0xfffabca7),
  2: const Color(0xffF4A3C8),
  3: const Color(0xff59C787),
  4: const Color(0xfffcd89d),
  5: const Color(0xffd884d9),
  6: const Color(0xffee6c7f)
};
Map<int, Color> popuptextcolor = {
  1: const Color.fromARGB(255, 250, 104, 56),
  2: const Color(0xffED1E91),
  3: const Color.fromARGB(255, 0, 117, 51),
  4: const Color(0xfff8a41b),
  5: const Color(0xff9f3b95),
  6: const Color(0xffbd253c)
};

Map<int, String> pointmessage = {
  1: 'Congratulations! You scored a point!',
  2: 'Keep up the good work!',
  3: 'You\'re doing great!',
  4: 'I\'m proud of you!',
  5: 'One step closer to your goal!',
  6: 'You\'re on the right track!',
  7: 'You\'re amazing!',
  8: 'You\'re a rockstar!',
  9: 'You\'re unstoppable!',
  10: 'You can do anything!', 
};

Map<int, String> nopointmessage = {
  1: 'Keep going, you\'re improving!',
  2: 'Mistakes lead to growth. Persist!',
  3: 'Persistence pays off. Keep trying!',
  4: 'Believe in your abilities',
  5: 'Learn and improve with each game',
  6: 'Determination breeds success',
  7: 'Don\'t stress. You got this!',
  8: 'Each attempt brings you closer',
  9: 'Your effort matters. Keep it up!',
  10: 'Resilience fuels progress'
};


List<String> shuffleMessages(Map<int, String> messages) {
  List<String> shuffledMessages = [];
  List<int> keys = messages.keys.toList();
  keys.shuffle();
  for (int key in keys) {
    shuffledMessages.add(messages[key]!);
  }
  return shuffledMessages;
}

