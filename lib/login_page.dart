import 'package:crud/color_page.dart';
import 'package:crud/crud_Page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/sign_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Image(image: AssetImage(ImagePage.loginPage)),
          Column(
            children: [
              Text("CRUD",
                style: TextStyle(
                    color: color.primaryColor,
                    fontSize: w*0.09,
                    fontWeight: FontWeight.w900
                ),),
              Text("Create, Read, Update ,Delete",
                style: TextStyle(
                    color: color.primaryColor
                ),),
            ],
          ),
          Column(
            children: [
             Container(
               height: w*0.35,
               width: w*1,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => crudPage (),));
                      },
                     child: Container(
                       height: w*0.14,
                       width: w*0.7,
                       decoration: BoxDecoration(
                           color: color.primaryColor,
                           borderRadius:BorderRadius.circular(w*0.07)
                       ),
                       child: Center(
                         child: Text("Login",
                             style: TextStyle(
                                 color: color.secondaryColor,
                                 fontSize: w*0.05,
                                 fontWeight: FontWeight.bold
                             )),
                       ),
                     ),
                   ),
                   InkWell(
                     onTap: () {

                       Navigator.push(context, MaterialPageRoute(builder: (context) => signPage(),));
                     },
                     child: Container(
                       height: w*0.14,
                       width: w*0.7,
                       decoration: BoxDecoration(
                           color: color.secondaryColor,
                           border: Border.all(color: color.primaryColor,
                               width: w*0.005),
                           borderRadius:BorderRadius.circular(w*0.07)
                       ),
                       child: Center(
                         child: Text("Sign up",
                             style: TextStyle(
                                 color: color.primaryColor,
                                 fontSize: w*0.05,
                                 fontWeight: FontWeight.bold
                             )),
                       ),
                     ),
                   ),
                 ],
               ),
             )
            ],
          )
        ],
      ),
    );
  }
}
