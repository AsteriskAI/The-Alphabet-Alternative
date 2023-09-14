String alphabeta = "QWERTYUIOPASDFGHJKLZXCBNM";
List<String> actions = ["alt", "ask", "define", "draw","goalsetting","reflect","storytelling",
"alt",
"alt",
"alt",
"ask",
"ask",
"define",
"define",
"define",
"draw"
"draw",
"goalsetting",
"goalsetting",
"goalsetting",
"reflect",
"reflect",
"reflect",
"storytelling",
"storytelling",
"storytelling",
];
String root = 'assets/words/';
class CardDeckData {
  final List<String> frontCard = List.generate(alphabeta.length, (index) => root+alphabeta[index]+".svg");
  final List<String> backCard = List.generate(alphabeta.length, (index) => root+alphabeta[index]+" word.svg");
  final List<String> frontActionCard = List.generate(actions.length, (index) => root+actions[index]+".svg");
  final List<String> backActionCard = List.generate(actions.length, (index) => actions[index]+" desc.svg");
}


