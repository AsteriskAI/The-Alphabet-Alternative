String alphabeta = "LKJHGFDSAZXCVBNMQWERTYUIOP";
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

List<String> twistactions = [
  "alt",
  "alt",
  "alt",
  "alt",
  "storytelling",
  "ask",
  "ask",
  "ask",
  "goalsetting",
  "ask",
  "define",
  "define",
  "define",
  "define",
  "define",
  "storytelling",
  "draw",
  "draw",
  "draw",
  "draw",
  "reflect",
  "reflect",
  "reflect",
  "reflect",
  "reflect",
  "goalsetting",
  "goalsetting",
  "ask",
  "goalsetting",
  "goalsetting",
  "draw",
  "storytelling",
  "alt",
  "storytelling",
  "storytelling",
];

String root = 'assets/words/';
class CardDeckData {
  final List<String> frontCard = List.generate(alphabeta.length, (index) => "$root${alphabeta[index]}.svg");
  final List<String> backCard = List.generate(alphabeta.length, (index) => "$root${alphabeta[index]} word.svg");
  final List<String> frontActionCard = List.generate(classicactions.length, (index) => "$root${classicactions[index]}.svg");
  final List<String> backActionCard = List.generate(classicactions.length, (index) => "$root${classicactions[index]} desc.svg");
  final List<String> frontTwistActionCard = List.generate(twistactions.length, (index) => "$root${twistactions[index]}.svg");
  final List<String> backTwistActionCard = List.generate(twistactions.length, (index) => "$root${twistactions[index]} desc.svg");
}


