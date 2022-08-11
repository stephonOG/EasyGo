import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:theo/dashboard.dart';
import 'package:theo/splash_login/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }

  startTimer()async{
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: HexColor('ffffff'),
      body: Container(
        height: height,
        width: width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/easyGoLogo.png'),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: HexColor('5271FF'),
                    strokeWidth: 3,
                  ),
                ),
              )

            ],
          ),
        ),

      ),
    );
  }
}
