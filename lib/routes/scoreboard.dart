import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';


class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          Globals.logoImage,
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    createButton("Home", () {Navigator.pushNamed(context, '/landing');  }, Globals.globalColorScheme.scrim, Globals.globalColorScheme.outlineVariant),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
