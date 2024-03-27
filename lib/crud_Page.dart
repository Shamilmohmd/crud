import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/color_page.dart';
import 'package:crud/home_Page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/login_page.dart';
import 'package:crud/phone_page.dart';
import 'package:crud/sign_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class crudPage extends StatefulWidget {
  const crudPage({super.key});

  @override
  State<crudPage> createState() => _crudPageState();
}

class _crudPageState extends State<crudPage> {

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  final passwordValidation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  bool tap=true;

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:color.secondaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
          },
          child: Icon(CupertinoIcons.back,
          color: color.thirdColor,
          size: w*0.07),
        ),
        title:Text("CRUD",
        style: TextStyle(
          color: color.thirdColor,
          fontSize: w*0.06,
          fontWeight: FontWeight.bold
        )),
        backgroundColor: color.secondaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage(ImagePage.crudImg)),
            Column(
              children: [
                Form(
                  key: formKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: color.secondaryColor,
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: TextFormField(
                      style: TextStyle(
                          color: color.thirdColor
                      ),
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        // if(!emailValidation.hasMatch(value!))
                        // {
                        //   return "Enter the username";
                        // }
                        // else{
                        //   return null;
                        // }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter the Username",
                          hintStyle: TextStyle(
                              color: color.secondaryColor
                          ),
                          prefixIcon: Padding(
                            padding:  EdgeInsets.all(w*0.02),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide.none
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(w*0.03),
                              borderSide: BorderSide(
                                  color: color.primaryColor
                              )),
                          label: Text("Username",
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
                  ),
                ),
                SizedBox(height: w*0.04,),
                Container(
                  decoration: BoxDecoration(
                      color: color.secondaryColor,
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
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
                    obscureText: tap?true:false,
                    decoration: InputDecoration(
                        hintText: "Enter the password",
                        hintStyle: TextStyle(
                            color: color.primaryColor
                        ),
                        suffixIcon: InkWell(
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
                          borderSide: BorderSide(
                            color: color.primaryColor
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide(color: color.primaryColor)
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
                ),
              ],
            ),
              Container(
                height: w*0.7,
                width: w*1,
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: ()async {


                        //
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));


                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: nameController.text,
                            password: passwordController.text).then((value) async {


                        var namedata= await FirebaseFirestore.instance.collection("LoggedUser")
                            .where("email",isEqualTo: nameController.text.trim(),).get();

                        print("iiiiiiiii${namedata.docs.first.data()}");
                        print("${namedata.docs[0]["name"]}");

                        username=namedata.docs[0]["name"];

                        SharedPreferences prefs=await SharedPreferences.getInstance();
                        prefs.setString("name", username.toString());

                          Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(),));

                        }


                        ).catchError((error){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                        });


                      },
                      child: Container(
                        height: w*0.14,
                        width: w*0.7,
                        padding: EdgeInsets.only(left:w*0.05),
                        decoration: BoxDecoration(
                            color: color.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.07),
                            border: Border.all(color: color.primaryColor,
                                width: w*0.005)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(ImagePage.lock,
                            width: w*0.05),
                            Text("Login",
                             style: TextStyle(
                               color: color.primaryColor,
                               fontSize: w*0.05,
                               fontWeight: FontWeight.bold
                             ),),
                            SizedBox()
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                       onTap:() {
                         signInWithGoogle().then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => homePage(),), (route) => false));
                       }, 
                      child: Container(
                        height: w*0.14,
                        width: w*0.7,
                        padding: EdgeInsets.only(left:w*0.03),
                        decoration: BoxDecoration(
                            color: color.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.07),
                            border: Border.all(color: color.primaryColor,
                                width: w*0.005)
                        ),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(ImagePage.google,
                          width: w*0.08),
                          Text("Sign in with Google",
                            style: TextStyle(
                                color: color.primaryColor,
                                fontSize: w*0.05,
                                fontWeight: FontWeight.bold
                            ),),
                          SizedBox()
                        ],
                      ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => phonePage(),));
                      },
                      child: Container(
                        height: w*0.14,
                        width: w*0.7,
                        padding: EdgeInsets.only(left: w*0.05),
                        decoration: BoxDecoration(
                            color: color.secondaryColor,
                            borderRadius: BorderRadius.circular(w*0.07),
                            border: Border.all(color: color.primaryColor,
                                width: w*0.005)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(ImagePage.call,
                                width: w*0.06),
                            Text("OTP sign in",
                              style: TextStyle(
                                  color: color.primaryColor,
                                  fontSize: w*0.05,
                                  fontWeight: FontWeight.bold
                              ),),
                            SizedBox()
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account ?",
                          style: TextStyle(
                              color: color.primaryColor,
                              fontSize: w*0.04
                          ),),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => signPage (),));
                          },
                          child: Text("Create now",
                          style: TextStyle(
                            color: color.primaryColor,
                            fontSize: w*0.04,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
