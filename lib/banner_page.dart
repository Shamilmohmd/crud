import 'package:crud/color_page.dart';
import 'package:crud/image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'main.dart';

class bannerPage extends StatefulWidget {
  const bannerPage({super.key});

  @override
  State<bannerPage> createState() => _bannerPageState();
}

class _bannerPageState extends State<bannerPage> {


  List abc=[
    "assets/images/nara1.jpg",
    "assets/images/itachi3.jpg",
    "assets/images/obito.jpg",
  ];

  List text1=[
    "Banner 1",
    "Banner 2",
    "Banner 3",
  ];
  
  List text2=[
    "2 May",
    "2 May",
    "2 May",
  ];
  
  TextEditingController bannerController=TextEditingController();

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
        title: Text("Banner",
            style: TextStyle(
                color: color.thirdColor,
                fontSize: w*0.06
            )),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Image(image: AssetImage(ImagePage.bannerImg)),
            SizedBox(height: w*0.03,),
            Container(
              decoration: BoxDecoration(
                  color: color.secondaryColor,
                  borderRadius: BorderRadius.circular(w*0.03)
              ),
              child: TextFormField(
                style: TextStyle(
                    color: color.primaryColor
                ),
                controller: bannerController,

                keyboardType: TextInputType.name,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                },
                decoration: InputDecoration(
                    hintText: "Banner 4",
                    hintStyle: TextStyle(
                        color: color.primaryColor
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
                    label: Text("Title",
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
            SizedBox(height: w*0.03,),
            Container(
              height: w*0.14,
              width: w*0.65,
              child: Center(
                child: Text("Upload Banner",
                style: TextStyle(
                  color: color.primaryColor,
                  fontSize: w*0.05,
                  fontWeight: FontWeight.bold
                )),
              ),
              decoration: BoxDecoration(
                color: color.secondaryColor,
                borderRadius: BorderRadius.circular(w*0.03),
                border: Border.all(color: color.primaryColor,
                width: w*0.005),
              ),
            ),
            SizedBox(height: w*0.03,),
            Expanded(
              child: ListView.separated(
                itemCount: abc.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: w*0.27,
                    width: w*1,
                    padding: EdgeInsets.only(top: w*0.04),
                    decoration: BoxDecoration(
                        color: color.sixthColor,
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: ListTile(
                      leading: Container(
                        height: w*0.27,
                        width: w*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: Colors.green,
                          image: DecorationImage(image: AssetImage(abc[index]),
                          fit: BoxFit.fill)
                        ),
                      ),
                      title: Text(text1[index],
                      style: TextStyle(
                        color: color.fifthColor,
                        fontSize: w*0.05
                      )),
                      subtitle: Text(text2[index],
                      style: TextStyle(
                        fontSize: w*0.04,
                        color: color.thirdColor
                      )),
                      trailing: Icon(CupertinoIcons.trash_fill,
                      color: Colors.red),
                    )
                    // Row(
                    //   children: [
                    //     Container(
                    //       height: w*0.34,
                    //       width: w*0.35,
                    //       margin: EdgeInsets.all( w*0.03),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(w*0.03),
                    //         color: Colors.green,
                    //         image: DecorationImage(image: AssetImage(abc[index]),
                    //         fit: BoxFit.fill)
                    //       ),
                    //     ),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(text1[index],
                    //         style: TextStyle(
                    //           color: color.fifthColor,
                    //           fontSize: w*0.05,
                    //         ),),
                    //         Text(text2[index],
                    //         style: TextStyle(
                    //           fontSize: w*0.045
                    //         ),)
                    //       ],
                    //     ),
                    //     Icon(CupertinoIcons.trash,color: Colors.red,)
                    //   ],
                    // ),
                  );
                },
                separatorBuilder: (context, index) {
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
