import 'dart:async';

import 'package:crud/viva/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class vivaSplashscreen extends StatefulWidget {
  const vivaSplashscreen({super.key});

  @override
  State<vivaSplashscreen> createState() => _vivaSplashscreenState();
}

class _vivaSplashscreenState extends State<vivaSplashscreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
    () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => page1(),)),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("SPLASH",
              style: TextStyle(
                  fontSize: w*0.08,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
          )
        ],
      ),
    );
  }
}
