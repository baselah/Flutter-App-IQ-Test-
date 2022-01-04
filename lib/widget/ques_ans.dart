import 'package:flutter/material.dart';
import 'package:quizapp/widget/main_background_screen.dart';

class Quiz extends StatefulWidget {
  final qus;
  List ans = [];
  final Function _answerQuestion;
  Quiz(this._answerQuestion, this.qus, this.ans, {Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int num = 0, char = 0;

  bool hasbeenPressed = false;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BackGroundScrren(
         Center(
           child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            offset: Offset(5, 5),
                            blurRadius: 10)
                      ],
                      border: Border.all(
                        width: 1,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.greenAccent),
                  child: Text(
                    '${widget.qus}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.green,
                        offset: Offset(5, 5),
                        blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                    children: widget.ans
                        .map(
                          (e) => TextButton(
                            clipBehavior: Clip.hardEdge,
                            onPressed: () => {
                              if (!hasbeenPressed)
                                {
                                  setState(
                                    () {
                                      hasbeenPressed = true;
                                    },
                                  ),
                                  num = e['score'],
                                }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: hasbeenPressed
                                  ? e['score'] == 1
                                      ? Colors.green
                                      : num == 1
                                          ? Colors.white
                                          : Colors.redAccent
                                  : Colors.white,
                            ),
                            child: Chip(
                              avatar: CircleAvatar(
                                child: Text(e['ch']),
                              ),
                              label: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  e['text'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton.icon(
                  onPressed: () {
                    if (!hasbeenPressed) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text('Warning'),
                          content: const Text(
                              'Please answer question before you contionue !'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Ok')),
                          ],
                        ),
                      );
                    } else {
                      widget._answerQuestion(num);
                      hasbeenPressed = false;
                    }
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.greenAccent,
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),

                  ),
                  icon: const Icon(Icons.next_plan),
                  label: const Text(
                    'Next Question',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
        ),
         ),
      ),
    );
  }
}
