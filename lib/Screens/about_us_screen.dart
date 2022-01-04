import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  static const routeNName = '/aboutUS';
  Widget buildButton(String text, IconData icon, VoidCallback? onpressed) {
    return TextButton.icon(
      onPressed: onpressed,
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  void _launchURL() async {
    if (!await launch('https://www.facebook.com/basel.alhwary')) {
      throw 'Could not Launch';
    }
  }

  void _launchCaller() async {
    if (!await launch('tel:+963988107855')) {
      throw 'Could not Launch';
    }
  }

  void _launchEmail() async {
    if (!await launch('mailto:basel.ah.991@gmail.com')) {
      throw 'Could not Launch';
    }
  }

  double _heightScreen(BuildContext context) {
    double ret = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height);
    print(ret);
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height:
                _heightScreen(context) < 600 ? null : _heightScreen(context),
            padding: const EdgeInsets.all(20),
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
            child: Column(
              children: [
                const Text(
                  'My name is Basel Alhawari and I am 21 years old student at Tishreen University informatics engineering software engineering department and I am flutter developer with 1 year experience',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Contact Us ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildButton(
                  'Basel Alhawari',
                  Icons.facebook,
                  _launchURL,
                ),
                buildButton(
                  'Phone',
                  Icons.phone,
                  _launchCaller,
                ),
                buildButton(
                  'Email',
                  Icons.email,
                  _launchEmail,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
