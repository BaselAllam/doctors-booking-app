import 'package:doctor/screens/splash.dart';
import 'package:flutter/material.dart';

import 'screens/splash.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreens(),
    );
  }
}


// AIzaSyCRGuW90Q4TMsgnbKHYLkea8M3zcBW8bYk