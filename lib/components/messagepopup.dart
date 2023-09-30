import 'dart:async';
import 'package:alphabetalternative/components/global.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MessagePopup extends StatefulWidget {
  final Function()? onProceed;
  final String text;
  final Color? backgroundColor; 
  final Color? textColor; 
  final Duration duration;

  

  const MessagePopup({Key? key, required this.text, this.onProceed, required this.backgroundColor, required this.textColor, required this.duration}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MessagePopupState createState() => _MessagePopupState();
}

class _MessagePopupState extends State<MessagePopup> {
  late int randomIndex;
  late List<String> shuffledPointMessages;
  late List<String> shuffledNoPointMessages;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    randomIndex = Random().nextInt(messagepopupbgcolor.length) + 1;
    shuffledPointMessages = shuffleMessages(pointmessage);
    shuffledNoPointMessages = shuffleMessages(nopointmessage);

    // Initialize and start the confetti animation
    controller.play();

    if (Globals.point) {
          Timer(const Duration(seconds: 3), () {
      controller.stop();
      if (widget.onProceed != null) {
        widget.onProceed!();
      }
      Navigator.pop(context);
    
    });
    } else {
      Timer(const Duration(seconds: 1), () {
        if (widget.onProceed != null) {
        widget.onProceed!();
      }
      Navigator.pop(context);
      } );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
  Widget contentBox(BuildContext context) {
  return Stack(
    children: <Widget>[
      Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: widget.backgroundColor,
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
              if (Globals.point)
                ConfettiWidget(
                  confettiController: controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  blastDirection: -pi / 2,
                  emissionFrequency: 0.04,
                  gravity: 0.2,
                ),
              Text(
                widget.text,
                style: TextStyle(
                  fontFamily: 'Mooli',
                  fontSize: 24,
                  color: widget.textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
}
  




Map<int, Color> messagepopupbgcolor = {
  1: const Color(0xfffabca7),
  2: const Color(0xffffcfe4),
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
  1: 'Don\'t worry, you\'ll get it next time!',
  2: 'You\'re still doing great!',
  3: 'Every step counts!',
  4: 'You\'re on the right track!',
  5: 'You can do anything!',
  6: 'You\'re perfect the way you are',
  7: 'Don\'t stress. You got this!',
  8: 'Sending some good vibes and happy thoughts your way',
  9: 'I believe in you!',
  10: 'You\'re doing exactly what you should be doing. Hang in there.'
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
