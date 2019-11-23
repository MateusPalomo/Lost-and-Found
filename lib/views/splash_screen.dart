import 'package:flutter/material.dart';
import 'package:lost_and_found/views/sign_in_page2.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    
     return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('Bem-vindo ao App!',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.asset("assets/img/flutter.png"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
    
  }
}