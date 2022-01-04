import 'package:flutter/material.dart';

class BackGroundScrren extends StatelessWidget {
  BackGroundScrren(this.MyChild, {Key? key}) : super(key: key);

  final Widget MyChild;

  double _heightScreen(BuildContext context) {
    double ret = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        AppBar().preferredSize.height);
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _heightScreen(context) < 600 ? null : _heightScreen(context),
      padding: MediaQuery.of(context).orientation == Orientation.landscape
          ? const EdgeInsets.only(left: 20, right: 20, top: 10)
          : const EdgeInsets.only(left: 20, right: 20, top: 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF85EB4D), Color(0xFFBBE7A3), Color(0xFF558F36)],
          stops: [0, 0.6, 1],
          begin: AlignmentDirectional(1, -1),
          end: AlignmentDirectional(-1, 1),
        ),
      ),
      child: MyChild,
    );
  }
}
