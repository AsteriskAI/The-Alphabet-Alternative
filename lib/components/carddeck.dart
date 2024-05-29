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

List<String> insightcards = [
  "coping",
  "coping",
  "coping",
  "coping",
  "coping",
  "embody",
  "embody",
  "embody",
  "embody",
  "embody",
  "experience",
  "experience",
  "experience",
  "experience",
  "experience",
  "media",
  "media",
  "media",
  "media",
  "media",
  "melody",
  "melody",
  "melody",
  "melody",
  "melody",
];

String root = 'assets/words/';
String root2 = 'assets/insights/';

class CardDeckData {
  final List<String> frontCard = List.generate(
      alphabeta.length, (index) => "$root${alphabeta[index]}.png");
  final List<String> backCard = List.generate(
      alphabeta.length, (index) => "$root${alphabeta[index]} word.png");
  final List<String> frontActionCard = List.generate(
      classicactions.length, (index) => "$root${classicactions[index]}.png");
  final List<String> backActionCard = List.generate(classicactions.length,
      (index) => "$root${classicactions[index]} desc.png");
  final List<String> frontTwistActionCard = List.generate(
      twistactions.length, (index) => "$root${twistactions[index]}.png");
  final List<String> backTwistActionCard = List.generate(
      twistactions.length, (index) => "$root${twistactions[index]} desc.png");
  final List<String> insightFrontActionCard = List.generate(
      insightcards.length, (index) => "$root2${insightcards[index]}.png");
  final List<String> insightBackActionCard = List.generate(
      insightcards.length, (index) => "$root2${insightcards[index]} desc.png");
}
