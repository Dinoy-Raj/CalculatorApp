import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(
      height: 200,
      width: 200,
      child: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_u4vfaqk9.json"),
    ));
  }
}
