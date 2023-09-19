import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/carddeck.dart';
import 'package:alphabetalternative/components/slider.dart';
import 'package:alphabetalternative/components/button.dart';


class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  bool isGameMode1Selected = true;
  String gamemode = '';
  CardDeckData cardDeckData = CardDeckData();
  bool isGameMode2Selected = true;

    
  

  @override
  Widget build(BuildContext context) {
    if (isGameMode1Selected) {
      gamemode = '/classic';
    } else {
      (isGameMode2Selected) {
      gamemode = '/twist';
    };
    }

    return Scaffold(
    backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          Globals.logoImage,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Players', style: TextStyle(color: Globals.globalColorScheme.tertiary, fontSize: 26),),
                  const MySlider(),
                  Text('Game Mode', style: TextStyle(color: Globals.globalColorScheme.tertiary, fontSize: 26),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton(
                    'Classic',
                    () {
                      setState(() {
                        isGameMode1Selected = true;
                        isGameMode2Selected = false; 
                      });
                    },
                    isGameMode1Selected
                        ?Globals.globalColorScheme.error
                        : Globals.globalColorScheme.onError.withOpacity(0.12), 
                    isGameMode1Selected
                    ? Globals.globalColorScheme.background
                    : Globals.globalColorScheme.onTertiary
              ),



              createButton(
                    'Twist',
                    () {
                      setState(() {
                        isGameMode2Selected = true;
                        isGameMode1Selected = false;
                      });
                    },
                    isGameMode2Selected
                        ?Globals.globalColorScheme.shadow
                        : Globals.globalColorScheme.onError.withOpacity(0.12), 
                    isGameMode2Selected
                    ? Globals.globalColorScheme.errorContainer
                    : Globals.globalColorScheme.onTertiary
              ),
                  ],
                ),

                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createButton("Start!", () {Navigator.pushNamed(context, gamemode,);  }, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
                    createButton("Back!", () {Navigator.pushNamed(context, '/landing');  }, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),
                  ],
                ),
                ],
              ),
            ),
          ),
        ] 
      )
    );
  }

}