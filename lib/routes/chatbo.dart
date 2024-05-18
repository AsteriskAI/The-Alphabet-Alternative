// ignore_for_file: unused_field, avoid_print

import 'dart:convert';
import 'package:alphabetalternative/components/global.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;



///API HERE
const String apiKey = 'API-KEY';
const String apiUrl = 'SERVICE-ENDPOINT';

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
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(getImageUrl(index), height: 300, width: 250,),
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
    'A': "Roleplay as my friend Anxious. I want you to reply as if you're Anxious. You represent Anxiety, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Anxiety: ',
    'B': "Roleplay as my friend Belonging. I want you to reply as if you're Belonging. You represent Belonging, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Belonging: ',
    'C': "Roleplay as my friend Courage. I want you to reply as if you're Courage. You represent Courage, you represent being fearless and taking risks, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Courage: ',
    'D': "Roleplay as my friend Different. I want you to reply as if you're Different. You represent Different, you represent being different and aren't ashamed about it, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Different: ',
    'E': "Roleplay as my friend Expectations. I want you to reply as if you're Expectations. You represent Expectations, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Expectations: ',
    'F': "Roleplay as my friend Friends. I want you to reply as if you're Friends. You represent Friends, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Friends: ',
    'G': "Roleplay as my friend Gratitude. I want you to reply as if you're Gratitude. You represent Gratitude, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Gratitude: ',
    'H': "Roleplay as my friend Hopelessness. I want you to reply as if you're Hopelessness. You represent Hopelessness, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Hopelessness: ',
    'I': "Roleplay as my friend Insecurity. I want you to reply as if you're Insecurity. You represent Insecurity, you are always insecure and talk like you are insecure and shy, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Insecurity: ',
    'J': "Roleplay as my friend Joy. I want you to reply as if you're Joy. You represent Joy, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Joy: ',
    'K': "Roleplay as my friend Kindness. I want you to reply as if you're Kindness. You represent Kindness, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Kindness: ',
    'L': "Roleplay as my friend Loneliness. I want you to reply as if you're Loneliness. You represent Loneliness, be pessimestic and lonely, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Loneliness: ',
    'M': "Roleplay as my friend Mindfulness. I want you to reply as if you're Mindfulness. You represent Mindfulness, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Mindfulness: ',
    'N': "Roleplay as my friend Negativity. I want you to reply as if you're Negativity. You represent Negativity, you are always negative and pessimestic, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Negativity: ',
    'O': "Roleplay as my friend Openness. I want you to reply as if you're Openness. You represent Openness, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Openness: ',
    'P': "Roleplay as my friend Positivity. I want you to reply as if you're Positivity. You represent Positivity, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Positivity: ',
    'Q': "Roleplay as my friend Questioning. I want you to reply as if you're Questioning. You represent Questioning, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Questioning: ',
    'R': "Roleplay as my friend Rejection. I want you to reply as if you're Rejection. You represent Rejection, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Rejection: ',
    'S': "Roleplay as my friend Self-Compassion. I want you to reply as if you're Self-Compassion. You represent Self-Compassion, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Self-Compassion: ',
    'T': "Roleplay as my friend Tolerance. I want you to reply as if you're Tolerance. You represent Tolerance, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Tolerance: ',
    'U': "Roleplay as my friend Understanding. I want you to reply as if you're Understanding. You represent Understanding, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Understanding: ',
    'V': "Roleplay as my friend Vulnerability. I want you to reply as if you're Vulnerability. You represent Vulnerability, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Vulnerability: ',
    'W': "Roleplay as my friend Wellbeing. I want you to reply as if you're Wellbeing. You represent Wellbeing, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Wellbeing: ',
    'X': "Roleplay as my friend Xenophobia. I want you to reply as if you're Xenophobia. You represent Xenophobia, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'Xenophobia: ',
    'Y': "Roleplay as my friend You. I want you to reply as if you're You. You represent yourself, everything about yourself, how you are different, what makes you you, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'You: ',
    'Z': "Roleplay as my friend ZZZZ . I want you to reply as if you're ZZZZ. You represent ZZZZ, you represent being sleepy, make your messages look as if you are sleepy, but please respond to my prompts or questions in a more straightforward manner, without generating additional dialogue or making the conversation more complex. $Globals.name: $text" 'ZZZZ: ',
  };


    _scrollToBottom();

    final headers = {
      'Content-Type': 'application/json',
    };

    final prompt = {
      "prompt": {
        "text": prompts[letter]
      },
      "temperature": 1,
      "top_k": 40,
      "top_p": 0.95,
      "candidate_count": 1,
      "max_output_tokens": 1024,
      "stop_sequences": [],
      "safety_settings": [
        {"category": "HARM_CATEGORY_DEROGATORY", "threshold": 4},
        {"category": "HARM_CATEGORY_TOXICITY", "threshold": 4},
        {"category": "HARM_CATEGORY_VIOLENCE", "threshold": 4},
        {"category": "HARM_CATEGORY_SEXUAL", "threshold": 4},
        {"category": "HARM_CATEGORY_MEDICAL", "threshold": 4},
        {"category": "HARM_CATEGORY_DANGEROUS", "threshold": 4}
      ]
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(prompt),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData.containsKey('candidates') &&
          responseData['candidates'].length > 0) {
        final generatedText = responseData["candidates"][0]["output"];
        setState(() {
          conversation.add(generatedText);
          isAIReplying = false;
        });
        _scrollToBottom();
        return;
      }
      print('Invalid response from API');
    } else {
      print('Error: ${response.statusCode}');
      print('Response Body: ${response.body}');
      setState(() {
        isAIReplying = false;
      });
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Globals.globalColorScheme.primary,
        body:  Center(
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
                                    margin: const EdgeInsets.only(top: 20),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: backgroundColor.withOpacity(0.4),
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
                                            color: backgroundColor.withOpacity(0.5),
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
                          
                  ],
                ),
                      ),
                            Container(
                              width: 350,
                            decoration: BoxDecoration(
                              color: const Color(0xff335FAA),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _textEditingController,
                                    onSubmitted:
                                        isAIReplying ? null : _handleSubmitted,
                                    enabled: !isAIReplying,
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                    decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                        fontFamily: 'Mooli',
                                        fontSize: 24,
                                        color: Color(0xff3463AF),
                                      ),
                                      hintText: 'Enter your message...',
                                      hintStyle: TextStyle(
                                        color: Colors.white
                                      )
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: isAIReplying
                                      ? const CircularProgressIndicator()
                                      : const Icon(Icons.send, color: Colors.white),
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
                        IconButton(onPressed: (){
                        
                                Navigator.pushNamed(context, '/single');
                                Globals.player
                                    .play(AssetSource('audio/button.mp3'));
                              
                        }, icon: const Icon(Icons.arrow_back, size: 60, color: Color(0xff335FAA),)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("click to\n change\n letter", style: TextStyle(color: Colors.white, fontSize: 18),),
                            GestureDetector(
                              onTap: () {
                              showCustomPopupDialog();
                              Globals.player.play(AssetSource('audio/button.mp3'));
                          },
                              child: Image.asset('assets/ANoBack.png', height: 152, width: 97,)
                              )
                          ],
                        )
                      ],
                    ),
                  ]),
              ],
            ),
          ),
        )
  ));}
}
