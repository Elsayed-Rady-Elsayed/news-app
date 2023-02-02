import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:your_news/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
          duration: 3000,
          splash: Image(image: NetworkImage("https://jobs-arabic.com/assets/uploads/2020/12/Daily-News-Egypt.png"),fit: BoxFit.fill,),
          splashIconSize: double.infinity,
          nextScreen: home_screen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          backgroundColor: Colors.black
      )
    );
  }
}

