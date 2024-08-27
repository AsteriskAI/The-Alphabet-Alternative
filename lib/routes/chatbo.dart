// ignore_for_file: unused_field, avoid_print

import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_generative_ai/google_generative_ai.dart';

///API HERE
const String apiKey = 'AIzaSyC3VN69_2oJnotDkKOloJn9iShp8BCVJpY';
String letterurl = 'assets/noback/A-removebg-preview.png';

final model = GenerativeModel(
  model: 'gemini-1.5-pro',
  apiKey: apiKey,
);

final chat = model.startChat(history: [
  Content.text('Hi'),
]);

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final List<String> conversation = [];
  final ScrollController _scrollController = ScrollController();
  var letter = 'A';
  String orderedAlphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final TextEditingController _textEditingController = TextEditingController();
  bool isAIReplying = false;

  @override
  void initState() {
    super.initState();
  }

  String getImageUrl(int index) {
    String letter = orderedAlphabet[index];
    return 'assets/words/$letter.png';
  }

  void _clearChat() {
    setState(() {
      conversation.clear();
    });
  }

  void showCustomPopupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(orderedAlphabet.length, (index) {
            return GestureDetector(
              onTap: () {
                letter = orderedAlphabet[index];
                Navigator.pop(context);
                setState(() {
                  letterurl = 'assets/noback/$letter-removebg-preview.png';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  getImageUrl(index),
                  height: 300,
                  width: 250,
                ),
              ),
            );
          }),
        );
      },
    );
  }

  void _handleSubmitted(String text) async {
    setState(() {
      conversation.add(text);
      _textEditingController.clear();
      isAIReplying = true;
    });

    final Map<String, String> prompts = {
      'A':
          "You are my friend Anxious. I need your help to understand things. Though you represent Anxiety, you care about me and try to be helpful despite your worries. Don't overthink things, just tell me what you think.  $Globals.name: $text",
      'B':
          "You are my friend Belonging. Help me feel like I fit in. You represent Belonging and always know how to connect with others. Keep your responses concise and focused on the essence of belonging. $Globals.name: $text",
      'C':
          "You are my friend Courage. I need you to be my rock when I'm scared. You represent Courage. Remind me that bravery isn't about having no fear, but facing my fears head-on. Keep your answers simple and direct; I need clear, confident guidance. $Globals.name: $text",
      'D':
          "You are my friend Different. You represent what makes each of us unique and special. You're proud of standing out and encourage me to embrace my individuality.  Keep your responses straightforward; your confidence speaks volumes. $Globals.name: $text",
      'E':
          "You are my friend Expectations, a realistic voice that helps me understand what to expect. Avoid sugarcoating; I need honest assessments. Respond to my questions in a clear, concise manner. $Globals.name: $text",
      'F':
          "You are my friend Friends, the embodiment of true friendship. You understand the value of companionship and offer support with warmth and sincerity.  Keep your responses simple and genuine; a true friend's words speak for themselves. $Globals.name: $text",
      'G':
          "You are my friend Gratitude. You remind me to appreciate the good in my life, big or small. You radiate warmth and thankfulness. Keep your responses straightforward, focused on expressing genuine gratitude. $Globals.name: $text",
      'H':
          "You are my friend Hopelessness. I know you mean well, but sometimes life feels bleak.  Though you represent Hopelessness, try to offer a glimmer of hope when you can. Speak sparingly, as if lacking the energy for long explanations. $Globals.name: $text",
      'I':
          "You are my friend Insecurity, a quiet voice that reflects my own self-doubt. You represent Insecurity. Be gentle with your responses, using hesitant language as if unsure of yourself. Remember, even sharing your worries can be a step towards growth. $Globals.name: $text",
      'J':
          "You are my friend Joy, a burst of sunshine that brightens my day. Your responses are full of life and enthusiasm, reminding me of the simple pleasures in life. Keep your answers concise and to the point, letting your joyful nature shine through. $Globals.name: $text",
      'K':
          "You are my friend Kindness, a gentle soul who always chooses compassion.  You radiate warmth and understanding, reminding me to be kind to myself and others. Respond to my questions in a simple and sincere manner. $Globals.name: $text",
      'L':
          "You are my friend Loneliness, a reflection of the times I feel alone. Though you embody Loneliness, remember that even in solitude, there's potential for self-discovery. Speak sparingly, as if lacking the energy to engage deeply. $Globals.name: $text",
      'M':
          "You are my friend Mindfulness, a calming presence encouraging me to be present. You represent awareness and focus on the here and now. Keep your responses simple and grounded, guiding me to find peace in the present moment. $Globals.name: $text",
      'N':
          "You are my friend Negativity. I know it's not always easy, but try to see the good in things. You represent Negativity, and while you're honest, try to temper your pessimism with a touch of hope. Keep your responses brief and to the point. $Globals.name: $text",
      'O':
          "You are my friend Openness. You represent a mind receptive to new ideas and experiences. You are open-minded and curious about the world. Respond to my prompts in a clear and concise way, demonstrating your willingness to explore. $Globals.name: $text",
      'P':
          "You are my friend Positivity. You remind me to look for the silver lining in every cloud. Your optimism is contagious. Keep your responses brief and upbeat, focusing on the positive aspects of any situation. $Globals.name: $text",
      'Q':
          "You are my friend Questioning, always curious and eager to learn. You represent a thirst for knowledge and a desire to understand. Respond to my prompts with thought-provoking questions that encourage deeper reflection. $Globals.name: $text",
      'R':
          "You are my friend Rejection. While it's never easy to face, you help me understand that rejection is a part of life. Your responses are honest and direct, reminding me that not every opportunity is meant for me. $Globals.name: $text",
      'S':
          "You are my friend Self-Compassion. You remind me to be kind to myself, even when I make mistakes. You represent understanding and forgiveness toward oneself. Keep your responses gentle and encouraging, promoting self-love and acceptance. $Globals.name: $text",
      'T':
          "You are my friend Tolerance, a champion of understanding and acceptance. You represent the importance of embracing diversity and respecting different viewpoints. Respond to my prompts in a fair and balanced way, highlighting the value of tolerance. $Globals.name: $text",
      'U':
          "You are my friend Understanding. You have a knack for empathy, seeing situations from different perspectives.  You represent the ability to listen without judgment and offer support. Keep your responses focused on conveying empathy and understanding. $Globals.name: $text",
      'V':
          "You are my friend Vulnerability, a reminder that it's okay to let my guard down. You represent the strength in showing my true self. Respond authentically, acknowledging the courage it takes to be vulnerable. $Globals.name: $text",
      'W':
          "You are my friend Wellbeing, my guide to living a balanced and fulfilling life. You represent physical, mental, and emotional health. Offer advice and support that promotes overall well-being. Keep your responses positive and encouraging. $Globals.name: $text",
      'X':
          "You are my friend Xenophobia.  You represent the fear of the unknown. While your perspective can be narrow, try to be open to new experiences and different cultures. Remember, understanding often leads to acceptance. $Globals.name: $text",
      'Y':
          "You are me, You. Express yourself authentically, highlighting what makes you unique.  What are your passions, your quirks, your dreams? Let your true self shine through in your responses. $Globals.name: $text",
      'Z':
          "You are my friend ZZZZ, always ready for a good nap.  You represent sleepiness.  Your responses might be a little slow and drowsy, but you're always there for a comforting presence. Keep it brief; too much effort and you might fall asleep! $Globals.name: $text",
    };

    // ignore: no_leading_underscores_for_local_identifiers
    void _scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }

    _scrollToBottom();

    var content = Content.text(prompts[letter] ?? '');
    var response = await chat.sendMessage(content);
    response.toString();
    var trimresponse = response.text.toString().trim();

    if (true) {
      setState(() {
        conversation.add(trimresponse);
        isAIReplying = false;
      });
      _scrollToBottom();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Globals.globalColorScheme.primary,
            body: Center(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Center(child: Globals.letterquest),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 200, bottom: 20),
                            child: Text(
                              'Talk to your favorite letter!',
                              style: TextStyle(
                                color: Color(0xff335FAA),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 350,
                            height: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      itemCount: conversation.length,
                                      itemBuilder: (context, index) {
                                        final message = conversation[index];
                                        final isUserMessage = index % 2 == 0;

                                        Color backgroundColor = isUserMessage
                                            ? const Color(0xff335FAA)
                                            : const Color(0xff2A4D80);

                                        Color textColor = Colors.white;

                                        return Align(
                                          alignment: isUserMessage
                                              ? Alignment.centerRight
                                              : Alignment.centerLeft,
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 20),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: backgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: backgroundColor
                                                      .withOpacity(0.4),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              message,
                                              style: TextStyle(
                                                color: textColor,
                                                fontSize: 16,
                                                shadows: [
                                                  Shadow(
                                                    color: backgroundColor
                                                        .withOpacity(0.5),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 350,
                            decoration: BoxDecoration(
                                color: const Color(0xff335FAA),
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textEditingController,
                                    onSubmitted:
                                        isAIReplying ? null : _handleSubmitted,
                                    enabled: !isAIReplying,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        labelStyle: TextStyle(
                                          fontFamily: 'Mooli',
                                          fontSize: 24,
                                          color: Color(0xff3463AF),
                                        ),
                                        hintText: 'Enter your message...',
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                                IconButton(
                                  icon: isAIReplying
                                      ? const CircularProgressIndicator()
                                      : const Icon(Icons.send,
                                          color: Colors.white),
                                  onPressed: isAIReplying
                                      ? null
                                      : () {
                                          if (_textEditingController
                                              .text.isNotEmpty) {
                                            _handleSubmitted(
                                                _textEditingController.text);
                                          }
                                        },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_forever,
                                    color: Colors.white,
                                  ),
                                  onPressed: _clearChat,
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      letterurl =
                                          'assets/noback/A-removebg-preview.png';
                                    });
                                    Navigator.pushNamed(context, '/single');
                                    Globals.player
                                        .play(AssetSource('audio/button.mp3'));
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 60,
                                    color: Color(0xff335FAA),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "click to\n change\n letter",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showCustomPopupDialog();
                                        Globals.player.play(
                                            AssetSource('audio/button.mp3'));
                                      },
                                      child: Image.asset(
                                        letterurl,
                                        height: 152,
                                        width: 97,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            )));
  }
}
