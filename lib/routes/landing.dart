import 'package:alphabetalternative/components/global.dart';
import 'package:alphabetalternative/main.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: globalColorScheme.primary,
        body: Stack(
          children: [
            Container(
              child: Globals.logoImage,
              
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "Let's Go!", onPressed: (){}, color: globalColorScheme.scrim, textcolor: globalColorScheme.outlineVariant),
                    CustomButton(text: "Game Rules", onPressed: (){}, color: globalColorScheme.onSurface, textcolor: globalColorScheme.surfaceVariant),
                    CustomButton(text: "Learn More!", onPressed: (){}, color: globalColorScheme.surface, textcolor: globalColorScheme.onSurfaceVariant)

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
