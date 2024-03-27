import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/color_page.dart';
import 'package:crud/crud_Page.dart';
import 'package:crud/home_Page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/model/user_model.dart';
import 'package:crud/verify_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class signPage extends StatefulWidget {
  const signPage({super.key});

  @override
  State<signPage> createState() => _signPageState();
}

class _signPageState extends State<signPage> {



  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordController2=TextEditingController();

  int count=1;

  final emailValidation = RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordValidation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  pickFile(ImageSource) async {
    final pickedFile=await ImagePicker.platform.pickImage(source:ImageSource);
    file=File(pickedFile!.path);
    if(mounted){
      setState(() {
        file=File(pickedFile.path);
      });
      uploadFile(file);
    }
  }
  var file;
  String imageurl="";

  uploadFile(File file) async {
    if(file !=null) {
      var uploadTask = await FirebaseStorage.instance
      .ref("images")
      .child("${DateTime.now()}")
      .putFile(file!,
      SettableMetadata(contentType: "image/jpg"));

      imageurl = await uploadTask.ref.getDownloadURL();
      print(imageurl);

      setState(() {

      });
    }
  }

  bool tap=true;
  bool tap2=true;

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => verifyPage(),));
          },
          child: Icon(CupertinoIcons.back,
          color: color.thirdColor,
          size: w*0.07),
        ),
        backgroundColor: color.secondaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text("User Registration",
        style: TextStyle(
          color: color.thirdColor,
          fontSize: w*0.06
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.04),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Stack(
                  children: [
                    // Container(
                    //   height: w*0.4,
                    //   width: w*0.5,
                    //   color: colorTheme.fourthColor,
                    // ),
                    Center(
                        child:file!= null ? CircleAvatar(
                            backgroundColor: color.secondaryColor,
                            radius: w*0.2,
                            backgroundImage: FileImage(file)
                        ): CircleAvatar(
                          radius: w*0.2,
                          backgroundColor: color.thirdColor,
                          backgroundImage: AssetImage(ImagePage.beckham),
                        )
                    ),
                    Positioned(
                      left: w*0.6,
                      bottom: w*0.02,
                      child: InkWell(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                Material(
                                  type: MaterialType.circle,
                                  color: Colors.transparent,
                                  child: CupertinoActionSheet(
                                      actions: <Widget>[
                                        CupertinoActionSheetAction(
                                          child: const Text('Photo Gallery'),
                                          onPressed: () {
                                            pickFile(ImageSource.gallery);
                                            Navigator.pop(context, 'One');
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: const Text('Camera'),
                                          onPressed: () {
                                            pickFile(ImageSource.camera);
                                            Navigator.pop(context, 'Two');
                                          },
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text('Cancel'),
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )),
                                ),
                          );
                        },
                        child: Container(
                          height: w*0.1,
                          width: w*0.1,
                          decoration: BoxDecoration(
                            color: color.primaryColor,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(w*0.05),
                                topRight: Radius.circular(w*0.05,),
                                bottomRight:Radius.circular(w*0.05,),
                                bottomLeft: Radius.circular(w*0.05)
                            ),
                          ),
                          child:  Icon(Icons.edit_outlined,
                              color: color.secondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
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
                        controller: passwordController2,
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
                      TextFormField(
                        style: TextStyle(
                            color: color.thirdColor
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
                        obscureText: tap2?true:false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: color.fourthColor,
                          hintText: "Enter the password",
                          hintStyle: TextStyle(
                              color: color.thirdColor
                          ),
                          prefixIcon: InkWell(
                              onTap: () {
                                tap2=!tap2;
                                setState(() {
                                });
                              },
                              child:tap2==false? Icon(Icons.visibility,
                                color: color.thirdColor,):Icon(Icons.visibility_off,
                                color: color.thirdColor,)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(CupertinoIcons.lock,
                          color: color.thirdColor,)
                          // label: Padding(
                          //   padding: EdgeInsets.all(w*0.11),
                          //   child: Text("New Password",
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
                    ],
                  ),
                ),
                Container(
                  height: w*0.6,
                  width: w*1,
                  child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:() async {
                          SharedPreferences prefs=await SharedPreferences.getInstance();
                          prefs.setString("name", nameController.text);

                          // FirebaseFirestore.instance.collection("User").add({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          // });

                          // FirebaseFirestore.instance.collection("User2").add({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          // });
                          //
                          // FirebaseFirestore.instance.collection("Students").doc(emailController.text).set({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          //
                          // });
                          //
                          // FirebaseFirestore.instance.collection("user").add({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          // }).then((value) {
                          //   value.update({
                          //     "id":value.id
                          //   });
                          // });

                          // FirebaseFirestore.instance.collection("Students").doc("users$count").set({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          //
                          //
                          // });
                          // count++;
                          // setState(() {
                          //
                          // });

                          // FirebaseFirestore.instance.collection("LoggedUser").add({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text
                          // });

                          // FirebaseAuth.instance.createUserWithEmailAndPassword(
                          //     email: emailController.text,
                          //     password: passwordController.text).then((value) =>
                          //
                          //     Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),))
                          //
                          // ).catchError((error){
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                          // });

                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text).then((value) {
                                FirebaseFirestore.instance.collection("LoggedUser").add({
                                  "name":nameController.text,
                                  "email":emailController.text,
                                  "password":passwordController.text,
                                });
                              },);
                          // FirebaseFirestore.instance.collection("LoggedUser").add({
                          //   "name":nameController.text,
                          //   "email":emailController.text,
                          //   "password":passwordController.text,
                          // });
                          
                          UsersModel model= UsersModel(
                            name: nameController.text,
                            password: passwordController.text,
                            email: emailController.text 
                          );
                          
                          FirebaseFirestore.instance.collection("model").add(model.toMap()).then((value){
                            value.update({
                             "id":value.id
                            });
                          });
                          
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => homePage(),))
                          .catchError((error){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                          });


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
                            child: Text("Sign Up",
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
                          Text("Already have an Account",
                            style: TextStyle(
                                fontSize: w*0.04,
                                color: color.thirdColor
                            ),),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => crudPage (),));
                            },
                            child: Text(" Login?",
                              style: TextStyle(
                                  color: color.primaryColor,
                                  fontSize: w*0.04,
                                  fontWeight:FontWeight.bold
                              ),),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
