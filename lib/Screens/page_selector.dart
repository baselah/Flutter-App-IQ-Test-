import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizapp/Screens/finish_screen.dart';
import 'package:quizapp/Screens/home_page.dart';
import 'package:quizapp/widget/ques_ans.dart';

class PageSelector extends StatefulWidget {
  const PageSelector(this.name, {Key? key}) : super(key: key);
  static const routeName = '/pageselector';
  final name;

  @override
  State<PageSelector> createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  int index = 0, totalScore = 0;

  void _answerQuestion(int a) {
    totalScore += a;
    setState(() {
      index++;
    });
  }

  static int maxSeconds = 100;
  int seconds = maxSeconds;
  Timer? timer;
  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (seconds > 0) {
          setState(() {
            seconds--;
          });
        } else {
          timer!.cancel();
        }
      },
    );
  }

  Widget result() {
    setState(() {
      timer!.cancel();
    });
    return FinishScreen(100 - seconds, totalScore, widget.name);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Qustions'),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(fit: StackFit.expand, children: [
              CircularProgressIndicator(
                value: 1 - seconds / maxSeconds,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 5,
                backgroundColor: Colors.greenAccent,
              ),
              Center(
                child: Text(
                  '$seconds',
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: index < question.length && seconds > 0
            ? index < 0
                ? const HomePage()
                : Quiz(_answerQuestion, question[index]['qus'],
                    question[index]['ans'] as List<Map<String, Object>>)
            : result(),
      ),
    );
    
  }

  final question = [
    {
      'qus': '1 - What is 4*6 ?',
      'ans': [
        {'ch': 'a', 'text': 4, 'score': 0},
        {'ch': 'b', 'text': 24, 'score': 1},
        {'ch': 'c', 'text': 44, 'score': 0},
        {'ch': 'd', 'text': 46, 'score': 0},
        {'ch': 'e', 'text': 66, 'score': 0},
      ]
    },
    {
      'qus': '2 - What is color of water ?',
      'ans': [
        {'ch': 'a', 'text': 'White', 'score': 0},
        {'ch': 'b', 'text': 'Green', 'score': 0},
        {'ch': 'c', 'text': 'Blue', 'score': 0},
        {'ch': 'd', 'text': 'Red', 'score': 0},
        {'ch': 'e', 'text': 'Has No Color', 'score': 1}
      ],
    },
    {
      'qus':
          '3 - Which number should come next in the pattern 37, 34, 31, 28 ?',
      'ans': [
        {'ch': 'a', 'text': 50, 'score': 0},
        {'ch': 'b', 'text': 22, 'score': 0},
        {'ch': 'c', 'text': 28, 'score': 0},
        {'ch': 'd', 'text': 25, 'score': 1},
        {'ch': 'e', 'text': 50, 'score': 0},
      ],
    },
    {
      'qus':
          '4 - The mystery number is between 60 and 150, a multiple of 7, and the sum of its digits is 10. What is the mystery number ?',
      'ans': [
        {'ch': 'a', 'text': 63, 'score': 0},
        {'ch': 'b', 'text': 84, 'score': 0},
        {'ch': 'c', 'text': 91, 'score': 1},
        {'ch': 'd', 'text': 82, 'score': 0},
        {'ch': 'e', 'text': 55, 'score': 0},
      ],
    },
    {
      'qus': '5 - Who was the first man on the moon ?',
      'ans': [
        {'ch': 'a', 'text': 'Lance Armstrong', 'score': 0},
        {'ch': 'b', 'text': 'George Washington', 'score': 0},
        {'ch': 'c', 'text': 'My mom', 'score': 0},
        {'ch': 'd', 'text': 'Neil Armstrong', 'score': 1},
        {'ch': 'e', 'text': 'Me', 'score': 0},
      ],
    },
    {
      'qus': '6 -  Who is The best football player in the world?',
      'ans': [
        {'ch': 'a', 'text': 'Neymar Junior', 'score': 0},
        {'ch': 'b', 'text': 'Lionel Messi', 'score': 1},
        {'ch': 'c', 'text': 'Cristiano Ronaldo', 'score': 0},
        {'ch': 'd', 'text': 'Mohammad Salah', 'score': 0},
        {'ch': 'e', 'text': 'Sergio Roberto', 'score': 0},
      ],
    },
    {
      'qus': '7 - If I drink, I die. If I eat, I\'m fine. What am I ?',
      'ans': [
        {'ch': 'a', 'text': 'Tree', 'score': 0},
        {'ch': 'b', 'text': 'Car', 'score': 0},
        {'ch': 'c', 'text': 'Monkey', 'score': 0},
        {'ch': 'd', 'text': 'Fire', 'score': 1},
        {'ch': 'e', 'text': 'Pizza', 'score': 0},
      ],
    },
    {
      'qus': '8 - What makes balloons float ?',
      'ans': [
        {'ch': 'a', 'text': 'Hydrogen', 'score': 0},
        {'ch': 'b', 'text': 'Barium', 'score': 0},
        {'ch': 'c', 'text': 'Calcium', 'score': 0},
        {'ch': 'd', 'text': 'Oxeygen', 'score': 0},
        {'ch': 'e', 'text': 'Helium ', 'score': 1},
      ],
    },
    {
      'qus': '9 - What is always coming, but never arrives ?',
      'ans': [
        {'ch': 'a', 'text': 'Yesterday', 'score': 0},
        {'ch': 'b', 'text': 'Today', 'score': 0},
        {'ch': 'c', 'text': 'Tomorrow', 'score': 1},
        {'ch': 'd', 'text': 'Last week', 'score': 0},
        {'ch': 'e', 'text': 'Everyday', 'score': 0},
      ],
    },
    {
      'qus':
          '10 - How many 6-inch by 6-inch books can you put in a 2-foot by 2-foot container, so that it\'s not empty anymore ?',
      'ans': [
        {'ch': 'a', 'text': 1, 'score': 1},
        {'ch': 'b', 'text': 2, 'score': 0},
        {'ch': 'c', 'text': 5, 'score': 0},
        {'ch': 'd', 'text': 6, 'score': 0},
        {'ch': 'e', 'text': 0, 'score': 0},
      ],
    },
    {
      'qus': '11 - What goes up and down but still remains in the same place ?',
      'ans': [
        {'ch': 'a', 'text': 'Water', 'score': 0},
        {'ch': 'b', 'text': 'Someone', 'score': 0},
        {'ch': 'c', 'text': 'Temperature', 'score': 1},
        {'ch': 'd', 'text': 'Car', 'score': 0},
        {'ch': 'e', 'text': 'None', 'score': 0},
      ],
    },
    {
      'qus': '12 - What was the first Disney movie ?',
      'ans': [
        {'ch': 'a', 'text': 'Cinderella', 'score': 0},
        {'ch': 'b', 'text': 'Snow White and the Seven Dwarfs', 'score': 1},
        {'ch': 'c', 'text': 'Moana', 'score': 0},
        {'ch': 'd', 'text': 'The Little Mermaid', 'score': 0},
        {'ch': 'e', 'text': 'Pirates', 'score': 0},
      ],
    },
    {
      'qus': '13 - How many legs do spiders have ?',
      'ans': [
        {'ch': 'a', 'text': 10, 'score': 0},
        {'ch': 'b', 'text': 7, 'score': 0},
        {'ch': 'c', 'text': 6, 'score': 0},
        {'ch': 'd', 'text': 8, 'score': 1},
        {'ch': 'e', 'text': 9, 'score': 0},
      ],
    },
    {
      'qus': '14 - What does most coffee contain ?',
      'ans': [
        {'ch': 'a', 'text': 'Proten', 'score': 0},
        {'ch': 'b', 'text': 'Creatine', 'score': 0},
        {'ch': 'c', 'text': 'Cacao', 'score': 0},
        {'ch': 'd', 'text': 'Amino acids', 'score': 0},
        {'ch': 'e', 'text': 'Caffeine', 'score': 1},
      ],
    },
    {
      'qus': '15 - At what temperature does water freeze ?',
      'ans': [
        {'ch': 'a', 'text': '55°F', 'score': 0},
        {'ch': 'b', 'text': '0°F', 'score': 0},
        {'ch': 'c', 'text': '100°F', 'score': 0},
        {'ch': 'd', 'text': '32°F', 'score': 1},
        {'ch': 'e', 'text': '75°F', 'score': 0},
      ],
    },
    {
      'qus': '16 - What is the world\'s tallest mountain ?',
      'ans': [
        {'ch': 'a', 'text': 'Kanchenjunga', 'score': 0},
        {'ch': 'b', 'text': 'Qasioon', 'score': 0},
        {'ch': 'c', 'text': 'Mount Everest', 'score': 1},
        {'ch': 'd', 'text': 'Mount Kailash', 'score': 0},
        {'ch': 'e', 'text': 'K2', 'score': 0},
      ],
    },
    {
      'qus': '17 - What is the longest river in the world ?',
      'ans': [
        {'ch': 'a', 'text': 'Nile', 'score': 1},
        {'ch': 'b', 'text': 'Yangtze', 'score': 0},
        {'ch': 'c', 'text': 'Lena', 'score': 0},
        {'ch': 'd', 'text': 'Mekong', 'score': 0},
        {'ch': 'e', 'text': 'Amazon', 'score': 0},
      ],
    },
    {
      'qus': '18 - An apple helped Isaac Newton discover what principle ?',
      'ans': [
        {'ch': 'a', 'text': 'Kinematics', 'score': 0},
        {'ch': 'b', 'text': 'Oscillation', 'score': 0},
        {'ch': 'c', 'text': 'Momentum', 'score': 0},
        {'ch': 'd', 'text': 'Gravity', 'score': 1},
        {'ch': 'e', 'text': 'None', 'score': 0},
      ],
    },
    {
      'qus': '19 - Pi is made up of how many digits ?',
      'ans': [
        {'ch': 'a', 'text': '3', 'score': 0},
        {'ch': 'b', 'text': '100', 'score': 0},
        {'ch': 'c', 'text': '10000', 'score': 0},
        {'ch': 'd', 'text': '10', 'score': 0},
        {'ch': 'e', 'text': 'Infinite', 'score': 1},
      ],
    },
    {
      'qus': '20 - What is the word for a person that doesn\'t eat meat OR animal products ?',
      'ans': [
        {'ch': 'a', 'text': 'Herbian', 'score': 0},
        {'ch': 'b', 'text': 'Omnivore', 'score': 0},
        {'ch': 'c', 'text': 'Carnivore', 'score': 0},
        {'ch': 'd', 'text': 'Vegan', 'score': 1},
        {'ch': 'e', 'text': 'Green', 'score': 0},
      ],
    },
  ];
}
