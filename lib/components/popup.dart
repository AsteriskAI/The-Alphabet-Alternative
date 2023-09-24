import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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
  late int randomIndex; // Initialize with a default index

  @override
  void initState() {
    super.initState();
    randomIndex = Random().nextInt(popupbgcolor.length) + 1;
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
                        Globals.player.play(AssetSource('audio/button.mp3'));
                        setState(() {
                          playerScores[Globals.currentplayer] = playerScores[Globals.currentplayer]! + 1;
                        });
                        Navigator.of(context).pop();
                        if (widget.onProceed != null) {
                          widget.onProceed!();
                        }
                        _updateRandomIndex(); 
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
  1: const Color(0xffEAB29C),
  2: const Color(0xffF4A3C8),
  3: const Color(0xff59C787),
  4: const Color(0xffffd366),
  5: const Color(0xffd884d9),
  6: const Color(0xffee6c7f),
};
Map<int, Color> popuptextcolor = {
  1: const Color(0xffF68D68),
  2: const Color(0xffED1E91),
  3: const Color(0xff2B9E5D),
  4: const Color(0xffe5ad21),
  5: const Color(0xff9f3b95),
  6: const Color(0xffbd253c),
};
