import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Globals.globalColorScheme.primary,
        body: Stack(
          children: [
            Container(
              child: Globals.logoImage,
              
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(text: "Let's Go!", onPressed: (){Navigator.pushNamed(context, '/selection');}, color: Globals.globalColorScheme.scrim, textcolor: Globals.globalColorScheme.outlineVariant),
                    CustomButton(text: "Game Rules", onPressed: (){}, color: Globals.globalColorScheme.onSurface, textcolor: Globals.globalColorScheme.surfaceVariant),
                    CustomButton(text: "Learn More!", onPressed: (){}, color: Globals.globalColorScheme.surface, textcolor: Globals.globalColorScheme.onSurfaceVariant)

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
