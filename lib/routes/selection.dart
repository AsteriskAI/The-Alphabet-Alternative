import 'package:alphabetalternative/components/global.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/slider.dart';


class Selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Globals.globalColorScheme.primary,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Globals.logoImage,
              Text('Player', style: TextStyle(color: Globals.globalColorScheme.tertiary, fontSize: 26),),
              MySlider()
              
            ],
          ),
        ] 
      )
    );
  }

}