import 'package:flutter/material.dart';
import 'package:alphabetalternative/components/global.dart';

List<Widget> generatePlayerNames({
  required int numberOfPlayers,
  required Map<int, Color> playerColors,
  required double playerBarWidth,
  required Map<int, Color> playerTextColor,
  required Map<int, String> playerName,
  required Function(int, String) onNameChanged,
  int maxCharacterLimit = 20,
}) {
  return List.generate(numberOfPlayers, (index) {
  final playerIndex = index + 1;
  final color = playerColors[playerIndex] ?? Globals.globalColorScheme.tertiary;
  final textColor = playerTextColor[playerIndex] ?? Colors.white;

  TextEditingController textController = TextEditingController(text: playerName[playerIndex]);

  void handleTextChange(String newName) {
    if (newName.isNotEmpty) { // Check if the entered name is not empty
      if (newName.length <= maxCharacterLimit) {
        onNameChanged(playerIndex, newName);
      } else {
        textController.text = newName.substring(0, maxCharacterLimit);
        textController.selection = TextSelection.fromPosition(
          TextPosition(offset: maxCharacterLimit),
        );
        onNameChanged(playerIndex, textController.text);
      }
    }
  }

  String? hintText = Globals.playerName[playerIndex]!.isEmpty
      ? 'Enter player $playerIndex'
      : Globals.playerName[playerIndex];

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: playerBarWidth,
          height: 90.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16, horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: handleTextChange,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintText: hintText, // Set the hint text here
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '${textController.text.length}/$maxCharacterLimit',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
});


}