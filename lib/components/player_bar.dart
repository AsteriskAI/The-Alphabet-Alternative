import 'package:alphabetalternative/routes/classic.dart';
import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';

List<Widget> generatePlayerBars({
  required int numberOfPlayers,
  required Map<int, Color> playerColors,
  required double playerBarWidth,
  required Map<int, Color> playerTextColor,
}) {
  return List.generate(numberOfPlayers, (index) {
    final playerIndex = index + 1;
    final color = playerColors[playerIndex] ?? Globals.globalColorScheme.tertiary;
    final textColor = playerTextColor[playerIndex] ?? Colors.white;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: playerBarWidth,
          height: 60.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Player $playerIndex',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${playerScores[playerIndex]}', // 
                style: TextStyle(
                  fontSize: 16,
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
