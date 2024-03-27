import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/color_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'main.dart';

class dataPass extends StatefulWidget {
  final String id;
  const dataPass({
    super.key,
    required this.id});

  @override
  State<dataPass> createState() => _dataPassState();
}

class _dataPassState extends State<dataPass> {

  List snapshotList=[];

  Map<String,dynamic> snapshotMap={};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        backgroundColor: color.secondaryColor,
        title: Text("DATA PASS",
        style: TextStyle(
          fontSize: w*0.05,
          color: color.thirdColor
        )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.04),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  // QuerySnapshot<Map<String,dynamic>> data = await FirebaseFirestore.instance.collection("User").get();
                  // snapshotList=data.docs;


                  DocumentSnapshot<Map<String,dynamic>> data1 = await FirebaseFirestore.instance.collection("user").doc(widget.id).get();
                  snapshotMap = data1.data()!;
                  setState(() {

                  });

                },
                child: Center(
                  child: Container(
                    height: w*0.2,
                    width: w*0.2,
                    decoration: BoxDecoration(
                      color: color.thirdColor,
                      borderRadius: BorderRadius.circular(w*0.05)
                    ),
                    child: Center(
                      child: Text("GET",
                      style: TextStyle(
                        color: color.secondaryColor
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: w*0.03,),
              Container(
                height: w*0.2,
                width: w*1,
                decoration: BoxDecoration(
                  color: color.fourthColor,
                  borderRadius: BorderRadius.circular(w*0.04)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshotMap["name"] ?? "",
                    style: TextStyle(
                      fontSize: w*0.045,
                      fontWeight: FontWeight.bold
                    )),
                    Text(snapshotMap["email"] ?? "",
                    style: TextStyle(
                      fontSize: w*0.045,
                      fontWeight: FontWeight.bold
                    )),
                    // Text(snapshotMap["password"] ?? "",
                    // style: TextStyle(
                    //   fontSize: w*0.045,
                    //   fontWeight: FontWeight.bold
                    // )),
                  ],
                ),
              ),
              // ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: BouncingScrollPhysics(),
              //   itemCount:snapshotList.length ,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         height: w*0.3,
              //         width: w*1,
              //         child: Column(
              //           children: [
              //             Text(snapshotList[index]["name"]),
              //             Text(snapshotList[index]["email"]),
              //             Text(snapshotList[index]["password"]),
              //           ],
              //         ),
              //       );
              //     },)
            ],
          ),
        ),
      ),
    );
  }
}
