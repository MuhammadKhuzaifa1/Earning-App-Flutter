import 'package:flutter/material.dart';

import 'SplashController.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    SplashController().checkUserController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
