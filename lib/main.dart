import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_app/UI/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  AnimationController? animationController;

  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds:3));
    animation=Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(parent:animationController! , curve:Curves.bounceInOut ));
    animationController!.forward();
    animation.addListener(() {
      setState(() {
        animation.value;
      });
    });

    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Container(
          color: Colors.indigo,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Transform.scale(
              scale: animation.value,
              child: Container(
                height: 100,
                width: 100,
                //  color: animation2.value,
                child:  Image.asset('assets/images/appointment.png',height: 100,width: 100,color: Colors.white,),
              ),
            )


          ),
        ),
      ),
    );
  }
}
