import 'dart:async';
import 'package:boyo3_v1/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> with SingleTickerProviderStateMixin{

  late Timer _timer;

  _goNext() => Navigator.pushReplacementNamed(context, Routes.homeScreen);
  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 6000), () => _goNext());
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          body: Center(
            child:
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.9),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Lottie.asset(
                'assets/images/boyo3_lottie.json',
                frameRate: FrameRate.max,
                fit: BoxFit.cover,

              ),
            ),
          )
      );

  }

}
