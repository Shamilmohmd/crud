import 'dart:convert';

import 'package:crud/color_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'main.dart';

class refreshPage extends StatefulWidget {
  const refreshPage({super.key});

  @override
  State<refreshPage> createState() => _refreshPageState();
}

class _refreshPageState extends State<refreshPage> {
  
  http.Response? apiData;
  List api=[];
  Map<String,dynamic> image={};


  
  getLink() async {
    apiData=await http.get(Uri.tryParse("https://api.thecatapi.com/v1/images/search")!);
    api=json.decode(apiData!.body);

    print(api);

    if(
    apiData !=null) {
      image = api[0] ?? [];
    }

  }
  
  
  @override
  void initState() {
    // TODO: implement initState
    getLink();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color.secondaryColor,
        title: Text("Api Data",
            style: TextStyle(
            color: color.thirdColor,
              fontWeight: FontWeight.bold,
              fontSize: w*0.06
        ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          children: [
            Container(
              height: w*0.6,
              width: w*1,
              decoration:  BoxDecoration(
                color: color.secondaryColor,
                borderRadius: BorderRadius.circular(w*0.03),
              ),
              child: Image(image: NetworkImage("${image["url"]}")),
            ),
            SizedBox(height: w*0.04,),
            InkWell(
              onTap: () {
                getLink();
                setState(() {

                });
              },
              child: Container(
                height: w*0.12,
                width: w*0.34,
                decoration: BoxDecoration(
                  color: color.thirdColor,
                  borderRadius: BorderRadius.circular(w*0.03),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.refresh_bold,
                    color: color.secondaryColor,),
                    Text("Refresh",
                    style: TextStyle(
                      color: color.secondaryColor,
                      fontSize: w*0.055
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
