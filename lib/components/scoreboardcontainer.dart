import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';

List<Widget> generatePlayerScoreboard({
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: playerBarWidth,
            height: 150.0,
            decoration: BoxDecoration(
              color: color,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 70.0, left: 10),
                        child: Column(
                          children: [
                            Text(
                              '${Globals.playerName[playerIndex]}',
                              style: TextStyle(
                                fontSize: 25,
                                color: textColor,
                              ),
                            ),
                            Text(
                              'Cards: ${Globals.playerActionCards[playerIndex]?.length}',
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        width: 150, 
                        child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (final imagePath in Globals.playerActionCards[playerIndex] ?? []) 
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Image.asset(imagePath),
                                    ),
                                ],
                              ),
                            ),

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}
