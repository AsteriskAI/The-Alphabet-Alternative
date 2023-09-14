import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';

List<Widget> generatePlayerBars({
  required int numberOfPlayers,
  required Map<int, Color> playerColors,
  required int currentPlayer,
  required double playerBarWidth,
  required Map<int, Color> playerTextColor, 


}) {
  return List.generate(numberOfPlayers, (index) {
    final playerIndex = index + 1;
    final color = playerColors[playerIndex] ?? Globals.globalColorScheme.tertiary;
    final textColor = playerTextColor[playerIndex] ?? Colors.white; 
    final isCurrentPlayer = playerIndex == currentPlayer;




    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: playerBarWidth, 
          height: 60.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Player $playerIndex',
                style: TextStyle(
                  fontSize: 20,
                  color: textColor, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isCurrentPlayer)
                Text(
                  '0', 
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor, 
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  });
}



