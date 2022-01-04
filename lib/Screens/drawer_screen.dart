import 'package:flutter/material.dart';
import 'package:quizapp/Screens/about_us_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  Widget buildButton(String text, IconData icon, VoidCallback? onpressed) {
    return TextButton.icon(
      onPressed: 
        onpressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(fontSize: 20,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IQ Test'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              buildButton('About US', Icons.info, () {
                Navigator.of(context).pushNamed(AboutUS.routeNName);
              },),
              const Divider(),
              buildButton('Rate Us', Icons.star, (){}),
              const Divider(),
              buildButton('Setting', Icons.settings, (){})
            ],
          ),
        ),
      ),
    );
  }
}
