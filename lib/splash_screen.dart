import 'package:crud/color_page.dart';
import 'package:crud/home_Page.dart';
import 'package:crud/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override


  getlogin() async {

    bool loggedin=false;

    SharedPreferences prefs=await SharedPreferences.getInstance();
    final String nameChecking = prefs.getString("name") ?? "";



    loggedin=prefs.getBool("login")??false;




    Future.delayed(Duration(
        seconds: 3
    )).then((value) {
      if(nameChecking!.isNotEmpty){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homePage()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
      }
    });

      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>loggedin==true ? homePage():loginPage(),)));

  }
  @override
  void initState() {
    getlogin();
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color.primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("CRUD",
            style: TextStyle(
              fontSize: w*0.1,
              color: color.secondaryColor,
              fontWeight: FontWeight.bold
            ),),
          )
        ],
      ),
    );
  }
}
