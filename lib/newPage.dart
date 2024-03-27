import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/color_page.dart';
import 'package:crud/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class newPage extends StatefulWidget {
  const newPage({super.key});

  @override
  State<newPage> createState() => _newPageState();
}

class _newPageState extends State<newPage> {

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  final emailValidation = RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordValidation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  bool tap=true;
  bool tap2=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar:AppBar(
        backgroundColor: color.secondaryColor,
        centerTitle: true,
        title: Text("New Page",
        style: TextStyle(
          color: color.thirdColor,
          fontSize: w*0.055,
          fontWeight: FontWeight.bold
        )),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: w*0.8,
                width: w*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: nameController,
                      style:TextStyle(
                          color: color.thirdColor
                      ),
                      decoration: InputDecoration(
                          fillColor: color.fourthColor,
                          filled: true,
                          hintText: "Full Nmae",
                          hintStyle: TextStyle(
                              color: color.thirdColor
                          ),
                          suffixIcon: Icon(CupertinoIcons.person,
                              color: color.thirdColor),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide.none
                          ),
                          // label: Text("Full Name",
                          //     style: TextStyle(
                          //         color: color.thirdColor,
                          //         fontSize: w*0.049
                          //     )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide(
                                color: color.fourthColor
                            ),
                          )
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                          color: color.thirdColor
                      ),
                      // textCapitalization: TextCapitalization.characters,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!emailValidation.hasMatch(value!))
                        {
                          return "Enter the email";
                        }
                        else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: color.fourthColor,
                          hintText: "Valid Email",
                          hintStyle: TextStyle(
                              color: color.thirdColor
                          ),
                          suffixIcon: Icon(Icons.email_outlined,
                              color: color.thirdColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide.none
                          ),
                          // label: Text("Email",
                          //     style: TextStyle(
                          //         color: color.secondaryColor,
                          //         fontSize: w*0.05
                          //     )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                  color: color.fourthColor
                              )
                          )
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: color.thirdColor,
                      ),
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!passwordValidation.hasMatch(value!))
                        {
                          return "Enetr the password";
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: tap?true:false,
                      decoration: InputDecoration(
                          fillColor: color.fourthColor,
                          filled: true,
                          hintText: "Enter the password",
                          hintStyle: TextStyle(
                              color: color.thirdColor
                          ),
                          prefixIcon: InkWell(
                              onTap: () {
                                tap=!tap;
                                setState(() {
                                });
                              },
                              child:tap==false? Icon(Icons.visibility,
                                color: color.thirdColor,):Icon(Icons.visibility_off,
                                color: color.thirdColor,)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(CupertinoIcons.lock,
                            color: color.thirdColor,)
                        // label: Padding(
                        //   padding: EdgeInsets.all(w*0.025),
                        //   child: Text("Password",
                        //       style: TextStyle(
                        //           color: color.thirdColor,
                        //           fontSize: w*0.05
                        //       )),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(width*0.03),
                        //     borderSide: BorderSide(
                        //         color: Colors.blue
                        //     )
                        // )
                      ),
                    ),
                    // TextFormField(
                    //   style: TextStyle(
                    //       color: color.thirdColor
                    //   ),
                    //   controller: passwordController,
                    //   autovalidateMode: AutovalidateMode.onUserInteraction,
                    //   validator: (value) {
                    //     if(!passwordValidation.hasMatch(value!))
                    //     {
                    //       return "Enetr the password";
                    //     }
                    //     else{
                    //       return null;
                    //     }
                    //   },
                    //   obscureText: tap2?true:false,
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: color.fourthColor,
                    //       hintText: "Enter the password",
                    //       hintStyle: TextStyle(
                    //           color: color.thirdColor
                    //       ),
                    //       prefixIcon: InkWell(
                    //           onTap: () {
                    //             tap2=!tap2;
                    //             setState(() {
                    //             });
                    //           },
                    //           child:tap2==false? Icon(Icons.visibility,
                    //             color: color.thirdColor,):Icon(Icons.visibility_off,
                    //             color: color.thirdColor,)),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(w*0.03),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       suffixIcon: Icon(CupertinoIcons.lock,
                    //         color: color.thirdColor,)
                    //     // label: Padding(
                    //     //   padding: EdgeInsets.all(w*0.11),
                    //     //   child: Text("New Password",
                    //     //       style: TextStyle(
                    //     //           color: color.thirdColor,
                    //     //           fontSize: w*0.05
                    //     //       )),
                    //     // ),
                    //     // focusedBorder: OutlineInputBorder(
                    //     //   borderRadius: BorderRadius.circular(width*0.03),
                    //     //     borderSide: BorderSide(
                    //     //         color: Colors.blue
                    //     //     )
                    //     // )
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: w*0.03,),
              InkWell(
                onTap: () {
                  UsersModel userModelData = UsersModel
                    (name: nameController.text,
                     password: passwordController.text,
                     email: emailController.text
                  );

                  FirebaseFirestore.instance.collection("User3").add(userModelData.toMap());
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
                    child: Text("Submit",
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
        ),
      ),
    );
  }
}
