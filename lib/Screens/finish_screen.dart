// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:quizapp/widget/main_background_screen.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen(this.time, this.score, this.name, {Key? key})
      : super(key: key);

  final String name;
  final int score;
  final int time;

  String _res() {
    String ret = 'Congrats $name You are very smart and amazing';
    if (time == 100) {
      ret = 'Time is end please try again and be Faster';
    } else if (score == 0) {
      ret = 'Sorry $name you are very weak !';
    } else if (score <= 5) {
      ret = 'Sorry $name you are a little weak !';
    } else if (score <= 10) {
      ret = '$name You are somewhat good';
    } else if (score <= 15) {
      ret = 'Congrats $name  You are good';
    } else if (score < 20) {
      ret = 'Congrats $name  you are very good and smart';
    }
    return ret;
  }

  Widget buildContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(5, 5), blurRadius: 10)
            ],
            border: Border.all(
              width: 1,
              color: Colors.green,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BackGroundScrren(
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: buildContainer('Thank you $name for your participation'),
              ),
              buildContainer(
                  'Your score is $score of 20 and you take $time seconds of 100 to finish'),
              buildContainer(_res()),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.home),
                label: const Text(
                  'try again',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
