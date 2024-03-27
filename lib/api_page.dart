import 'package:crud/color_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class apiPage extends StatefulWidget {
  const apiPage({super.key});

  @override
  State<apiPage> createState() => _apiPageState();
}

class _apiPageState extends State<apiPage> {
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
        title: Text("Postal Codes",
            style: TextStyle(
                color: color.thirdColor,
                fontSize: w*0.06
            )),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: color.sixthColor,
                  borderRadius: BorderRadius.circular(w*0.03)
              ),
              child: TextFormField(
                style:TextStyle(
                    color: color.thirdColor
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        size: w*0.08,
                        color: color.fifthColor),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(w*0.03),
                      // child: Icon(CupertinoIcons.search,
                      // color: color.fifthColor,)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide.none
                    ),
                    label: Text("Enter pincode",
                        style: TextStyle(
                            color: color.thirdColor,
                            fontSize: w*0.049
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: color.secondaryColor
                        )
                    )
                ),
              ),
            ),
            SizedBox(height: w*0.08,),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      height: w*0.23,
                      width: w*1,
                      padding: EdgeInsets.all(w*0.03),
                      decoration: BoxDecoration(
                        color: color.sixthColor,
                        borderRadius: BorderRadius.circular(w*0.03),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text("Postoffice:Perinthalmanna",
                               style: TextStyle(
                                 color: color.thirdColor,
                                 fontSize: w*0.05
                               ),)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Pincode:679325",
                              style: TextStyle(
                                color: color.thirdColor,
                                fontSize: w*0.05
                              ),)
                            ],
                          )
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: w*0.03,);
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}
