import 'dart:async';

import 'package:cryptopoints/screens/user/login_signup_forgot/sign_up.dart';
import 'package:flutter/material.dart';

import '../constants/constant_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: darkGreyColor,
        height: size.height,
        width: size.width,
        child: Center(
          child: Image.asset("assets/app_logo.png", height: size.width * 0.45, width: size.width * 0.8,),
        ),
      ),
    );
  }
}
