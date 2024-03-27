import 'dart:io';

import 'package:crud/color_page.dart';
import 'package:crud/home_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_page.dart';
import 'main.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {


  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  final emailValidation = RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordValidation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  pickFile(ImageSource) async {
    final pickedFile=await ImagePicker.platform.pickImage(source:ImageSource);
    file=File(pickedFile!.path);
    if(mounted){
      setState(() {
        file=File(pickedFile.path);
      });
    }
  }
  var file;

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
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.back,
              color: color.thirdColor,
              size: w*0.07),
        ),
        backgroundColor: color.secondaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text("Profile",
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
                            color: color.primaryColor
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                            fillColor: color.secondaryColor,
                            filled: true,
                            // hintText: "Full Nmae",
                            hintStyle: TextStyle(
                                color: color.thirdColor
                            ),
                            suffixIcon: Icon(CupertinoIcons.person,
                                color: color.thirdColor),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color: color.primaryColor)
                            ),
                            label: Text("User Name",
                                style: TextStyle(
                                    color: color.primaryColor,
                                    fontSize: w*0.049
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                  color: color.primaryColor
                              ),
                            )
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: color.primaryColor
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
                            fillColor: color.secondaryColor,
                            hintText: "Valid Email",
                            hintStyle: TextStyle(
                                color: color.primaryColor
                            ),
                            suffixIcon: Icon(Icons.email_outlined,
                                color: color.primaryColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                color: color.primaryColor
                              )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide.none
                            ),
                            label: Text("Email",
                                style: TextStyle(
                                    color: color.primaryColor,
                                    fontSize: w*0.05
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(
                                    color: color.primaryColor
                                )
                            )
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: color.primaryColor,
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
                            fillColor: color.secondaryColor,
                            filled: true,
                            hintText: "Enter the password",
                            hintStyle: TextStyle(
                                color: color.primaryColor
                            ),
                            prefixIcon: InkWell(
                                onTap: () {
                                  tap=!tap;
                                  setState(() {
                                  });
                                },
                                child:tap==false? Icon(Icons.visibility,
                                  color: color.primaryColor,):Icon(Icons.visibility_off,
                                  color: color.primaryColor,)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: Icon(CupertinoIcons.lock,
                              color: color.primaryColor,),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide(
                              color: color.primaryColor,
                            )
                          ),
                          label: Padding(
                            padding: EdgeInsets.all(w*0.025),
                            child: Text("Password",
                                style: TextStyle(
                                    color: color.primaryColor,
                                    fontSize: w*0.05
                                )),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                  color: color.primaryColor
                              )
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: w*0.04,),
                Container(
                  height: w*0.4,
                  width: w*1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showCupertinoDialog(
                              context: context,
                              builder: ((context) => CupertinoAlertDialog(
                                content: Text(" Are You Sure \n You Want to Update Details?",
                                    style: TextStyle(
                                        fontSize: w*0.04)),
                                actions:[
                                  CupertinoDialogAction(
                                    child: Text("Confirm"),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage (),));
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("Cancel"),
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(height: w*0.00001,)
                                ],
                              )) );
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
                            child: Text("Update",
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
            ),
          ),
        ),
      ),
    );
  }
}
