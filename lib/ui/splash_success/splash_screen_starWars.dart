import 'package:flutter/material.dart';

class SplashStarWars extends StatelessWidget {
  final Color? color;
  const SplashStarWars({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: color!,
        child: Center(
          child: Image.asset('Assets/img/stw.png',
              height: deviceHeight * 0.2, width: deviceWidth * 0.3),
        ),
      ),
    );
  }
}
