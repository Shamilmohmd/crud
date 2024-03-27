import 'package:country_code_picker/country_code_picker.dart';
import 'package:crud/color_page.dart';
import 'package:crud/crud_Page.dart';
import 'package:crud/image_page.dart';
import 'package:crud/verify_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class phonePage extends StatefulWidget {
  const phonePage({super.key});

  @override
  State<phonePage> createState() => _phonePageState();
}

class _phonePageState extends State<phonePage> {

  TextEditingController numberController=TextEditingController();

  final phoneValidation = RegExp(r"[0-9]{10}$");

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => crudPage(),));
          },
          child: Icon(CupertinoIcons.back,
          color: color.thirdColor,
          size: w*0.07),
        ),
        elevation: 0,
        backgroundColor: color.secondaryColor,
        title: Text("Enter Phone Number",
        style: TextStyle(
          fontSize: w*0.06,
          color: color.thirdColor,
          fontWeight: FontWeight.bold
        )),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: SingleChildScrollView (
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(image: AssetImage(ImagePage.phoneImg)),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Container(
                   height: w*0.7,
                   width: w*1,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                             color: color.secondaryColor,
                             borderRadius: BorderRadius.circular(w*0.03)
                         ),
                         child: TextFormField(
                           style: TextStyle(
                               color: color.thirdColor
                           ),
                           maxLength: 10,
                           controller: numberController,
                           keyboardType: TextInputType.number,
                           autovalidateMode: AutovalidateMode.onUserInteraction,
                           validator: (value) {
                             if(!phoneValidation.hasMatch(value!))
                             {
                               return "Enter valid number";
                             }
                             else {
                               return null;
                             }
                           },
                           decoration: InputDecoration(
                             counterText: "",
                             hintText: "Enter the number",
                             hintStyle: TextStyle(
                                 color: color.thirdColor
                             ),
                             suffixIconConstraints: BoxConstraints(
                                 minWidth: w*0.2
                             ),
                             // suffixIcon:Container(
                             //   width: w*0.07,
                             //   height: w*0.07,
                             //   child: Center(
                             //     child: SvgPicture.asset(ImagePage.call,
                             //         color: color.primaryColor,
                             //         width: w*0.07,
                             //         height: w*0.07),
                             //   ),
                             // ),
                             prefixIcon: CountryCodePicker(
                               flagDecoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(w*0.02)
                               ),
                               initialSelection: "IN",
                               showDropDownButton: true,
                               showFlagMain: true,
                               showFlag: true,
                               showCountryOnly: false,
                               hideMainText: true,
                             ),
                             enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(color: color.primaryColor),
                                 borderRadius: BorderRadius.circular(w*0.03)
                             ),
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(w*0.03),
                                 borderSide: BorderSide(color: color.primaryColor)
                             ),
                             label: Text("Number",
                                 style: TextStyle(
                                     color: color.primaryColor
                                 )),
                             // focusedBorder: OutlineInputBorder(
                             //   borderRadius: BorderRadius.circular(width*0.03),
                             //     borderSide: BorderSide(
                             //         color: Colors.blue
                             //     )
                             // )
                           ),
                         ),
                       ),
                       InkWell(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => verifyPage(),));
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
                             child: Text("Sent OTP",
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
                  Container(
                    height: w*0.39,
                    width: w*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign in with",
                                style: TextStyle(
                                    color: color.thirdColor,
                                    fontSize: w*0.04
                                )),
                            Text(" Another Method ?",
                              style: TextStyle(
                                  color: color.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: w*0.04),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


