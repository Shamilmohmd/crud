import 'package:carousel_slider/carousel_slider.dart';
import 'package:crud/api_page.dart';
import 'package:crud/banner_page.dart';
import 'package:crud/color_page.dart';
import 'package:crud/home_page2.dart';
import 'package:crud/image_page.dart';
import 'package:crud/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'main.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int Real=0;

  List abc=[
    "assets/images/nara1.jpg",
    "assets/images/itachi3.jpg",
    "assets/images/obito.jpg",
  ];


  String? name="";
  getName() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    username=prefs.getString("name") ?? "User";
  }

  @override
  void initState() {
    getName();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.fourthColor,
      appBar: AppBar(
        backgroundColor: color.fourthColor,
        title: Text("Hello,$username",
        style: TextStyle(
          color: color.thirdColor,
          fontSize: w*0.06
        )),
        leadingWidth: 0,
        leading: SizedBox(),
        actions: [
          CircleAvatar(
            radius: w*0.1,
            backgroundImage: AssetImage(ImagePage.beckham),
          ),
          SizedBox(width: w*0.02,),
          InkWell(
            onTap: () async {

              SharedPreferences prefs=await SharedPreferences.getInstance();
              prefs.remove("login");
              prefs.clear();

              Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage(),));
            },
            child: Icon(Icons.logout,
            color: color.thirdColor,
            size: w*0.08,),
          ),
          SizedBox(width: w*0.03,),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: Column(
            children: [
              CarouselSlider.builder(itemCount: abc.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding:  EdgeInsets.all(w*0.01),
                      child: Container(
                        // height: width*0.5,
                        width: w*0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.05),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15),
                                blurRadius: 4,
                                spreadRadius: 2,
                                offset: Offset(0, 4)
                            )],
                            image: DecorationImage(image: AssetImage(abc[index]),fit: BoxFit.fill
                            )
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(height: w*0.65,
                    viewportFraction: 0.88,
                    autoPlay: true,
                    // autoPlayInterval: Duration(milliseconds: 200),
                    onPageChanged: (index, reason) {
                      Real=index;
                      setState(() {
                      });
                    },)),
              SizedBox(height: w*0.04,),
              AnimatedSmoothIndicator(
                count: abc.length,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thinUnderground,
                ), activeIndex: Real,
              ),
              SizedBox(height: w*0.04,),
              Column(
                children: [
                  Container(
                    height: w*0.5,
                    width: w*1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => homePage2(),));
                          },
                          child: Container(
                            height: w*0.44,
                            width: w*0.44,
                            decoration:BoxDecoration(
                                color: color.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.08)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image(image: AssetImage(ImagePage.homePage1),
                                  width: w*0.16,),
                                Text("CRUD",
                                  style: TextStyle(
                                      color: color.thirdColor,
                                      fontSize: w*0.06,
                                      fontWeight: FontWeight.w500
                                  ),)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => bannerPage (),));
                          },
                          child: Container(
                            height: w*0.44,
                            width: w*0.44,
                            decoration:BoxDecoration(
                                color: color.secondaryColor,
                                borderRadius: BorderRadius.circular(w*0.08)
                            ),
                            child: Column(
                              children: [
                                Image(image: AssetImage(ImagePage.homePage2),
                                  width: w*0.35,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => apiPage(),));
                        },
                        child: Container(
                          height: w*0.44,
                          width: w*0.44,
                          decoration:BoxDecoration(
                              color: color.secondaryColor,
                              borderRadius: BorderRadius.circular(w*0.08)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage(ImagePage.homePage3),
                                width: w*0.3,),
                              Text("API",
                                style: TextStyle(
                                    color: color.thirdColor,
                                    fontSize: w*0.06,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
