import 'package:doctor/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'screens/splash.dart';
import 'package:doctor/models/categories/categoryController.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CategoryController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreens(),
      ),
    );
  }
}