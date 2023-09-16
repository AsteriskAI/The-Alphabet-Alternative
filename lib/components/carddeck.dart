String alphabeta = "QWERTYUIOPASDFGHJKLZXCBNM";
List<String> classicactions = [
  "alt",
  "alt",
  "alt",
  "alt",
  "alt",
  "ask",
  "ask",
  "ask",
  "ask",
  "ask",
  "define",
  "define",
  "define",
  "define",
  "define",
  "draw",
  "draw",
  "draw",
  "draw",
  "draw",
  "reflect",
  "reflect",
  "reflect",
  "reflect",
  "reflect",
];

String root = 'assets/words/';
class CardDeckData {
  final List<String> frontCard = List.generate(alphabeta.length, (index) => root+alphabeta[index]+".svg");
  final List<String> backCard = List.generate(alphabeta.length, (index) => root+alphabeta[index]+" word.svg");
  final List<String> frontActionCard = List.generate(classicactions.length, (index) => root+classicactions[index]+".svg");
  final List<String> backActionCard = List.generate(classicactions.length, (index) => root+classicactions[index]+" desc.svg");
}


