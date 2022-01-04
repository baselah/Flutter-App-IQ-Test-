import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizapp/Screens/page_selector.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  bool _validate = false;
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 20),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(5, 5), blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                shadowColor: Colors.greenAccent,
                elevation: 3,
                margin: EdgeInsets.only(top: 10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Lets get started : ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.only(top: 20),
                shadowColor: Colors.greenAccent,
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'You have 100 seconds to answer on 20 Question to begin please Input your name and press start',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.only(top: 20),
                shadowColor: Colors.greenAccent,
                elevation: 3,
                child: TextField(
                  decoration: InputDecoration(
                    errorText: _validate
                        ? 'Please input your name before continue'
                        : null,
                    labelText: 'Name',
                    icon: const Icon(Icons.person),
                  ),
                  controller: name,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Card(
                    shadowColor: Colors.greenAccent,
                    elevation: 3,
                    margin: const EdgeInsets.only(top: 10),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        if (name.text.isEmpty) {
                          setState(() {
                            _validate = true;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Welcome ${name.text}',
                              timeInSecForIosWeb: 3);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => PageSelector(name.text)));
                        }
                      },
                      icon: const Icon(Icons.star),
                      label: const Text(
                        'Start',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
