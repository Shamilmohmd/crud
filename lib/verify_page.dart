import 'package:crud/color_page.dart';
import 'package:crud/home_Page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/phone_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import 'main.dart';

class verifyPage extends StatefulWidget {
  const verifyPage({super.key});

  @override
  State<verifyPage> createState() => _verifyPageState();
}

class _verifyPageState extends State<verifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        backgroundColor: color.secondaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => phonePage(),));
          },
          child: Icon(CupertinoIcons.back,
          color: color.thirdColor,
          size: w*0.07),
        ),
        elevation: 0,
        title: Text("Verify OTP",
        style: TextStyle(
          color: color.thirdColor,
          fontSize: w*0.06
        )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image(image: AssetImage(ImagePage.verifyImg)),
          SizedBox(height: w*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OTP has been sent to",
              style: TextStyle(
                color: color.fourthColor,
                fontSize: w*0.04
              ),),
              Text("*****634",
              style: TextStyle(
                color: color.primaryColor,
                fontSize: w*0.04
              ),),
              SizedBox(width: w*0.03,),
              Icon(Icons.edit_outlined,
              color: color.primaryColor,
              size: w*0.045,)
            ],
          ),
          SizedBox(height: w*0.03,),
          FractionallySizedBox(
              child: Pinput(
                length: 5,
                errorTextStyle: TextStyle(
                    color: color.fourthColor
                ),
                closeKeyboardWhenCompleted: true,
              )
          ),
          SizedBox(height: w*0.03,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Resend code in",
                  style: TextStyle(
                      color: color.primaryColor,
                      fontSize: w*0.04
                  )),
              Countdown(
                seconds: 60,
                build: (p0, p1) {
                  return Text("$p1",
                    style: TextStyle(
                        color: color.thirdColor
                    ),);
                },),
              Text("s",
                  style: TextStyle(
                      color: color.primaryColor,
                      fontSize: w*0.04
                  )),
            ],
          ),
          SizedBox(height: w*0.03,),
          Container(
            height: w*0.4,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));
                  },
                  child: Container(
                    height: w*0.14,
                    width: w*0.7,
                    decoration: BoxDecoration(
                      color: color.secondaryColor,
                      borderRadius: BorderRadius.circular(w*0.07),
                      border: Border.all(color: color.primaryColor,
                          width: w*0.005),
                    ),
                    child: Center(
                      child: Text("Verify",
                          style: TextStyle(
                              color: color.primaryColor,
                              fontSize: w*0.05,
                              fontWeight: FontWeight.bold
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Haven't got the confirmation code yet?",
                    style: TextStyle(
                      fontSize: w*0.04,
                      color: color.thirdColor
                    ),),
                    Text("Resend",
                    style: TextStyle(
                      color: color.primaryColor,
                      fontSize: w*0.04
                    ),)
                  ],
                )
              ],
            ),
          ),
          Container(
            height: w*0.38,
            width: w*1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Try Another",
                    style: TextStyle(
                      fontSize: w*0.04,
                      color: color.thirdColor
                    ),),
                    Text(" Method?",
                    style: TextStyle(
                      color: color.primaryColor,
                      fontSize: w*0.04,
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
