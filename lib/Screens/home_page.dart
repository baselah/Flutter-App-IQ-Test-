
import 'package:flutter/material.dart';
import 'package:quizapp/Screens/drawer_screen.dart';
import 'package:quizapp/widget/content_widget.dart';
import 'package:quizapp/widget/main_background_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/Home page';


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IQ Test',
        ),
      ),
      drawer: const DrawerScreen(),
      
      body: SingleChildScrollView(
        child: BackGroundScrren(ContentWidget()),
      ),
    );
  }
}
