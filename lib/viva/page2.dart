import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class page2 extends StatefulWidget {
  final List b;
  const page2({super.key, required this.b});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  // pickFile(ImageSource) async {
  //   final pickedFile=await ImagePicker.platform.pickImage(source:ImageSource);
  //   file=File(pickedFile!.path);
  //   if(mounted){
  //     setState(() {
  //       file=File(pickedFile.path);
  //     });
  //   }
  // }
  // var file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.b);
    print("1234567890");
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("SPLASH"),
        ),
        body: Column(
          children: [
            Container(
              height: w * 0.12,
              width: w * 1,
              margin: EdgeInsets.all(w * 0.03),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(w * 0.05)),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.05),
                    color: Colors.black),
                tabs: [
                  Tab(
                    text: "ALL",
                  ),
                  Tab(
                    text: "Up to 100",
                  ),
                  Tab(
                    text: "Up to 1000",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: widget.b.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(w * 0.02),
                        child: Container(
                          height: w * 0.3,
                          width: w * 1,
                          padding: EdgeInsets.all(w * 0.025),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(w * 0.03)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: w * 0.25,
                                width: w * 0.28,
                                decoration: BoxDecoration(color: Colors.red),
                                child: Image.file(widget.b[index]["image"]),
                              ),
                              Column(
                                children: [
                                  Text(
                                    widget.b[index]["name"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.b[index]["price"],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: w * 0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  widget.b[index]["quantity"] == 0
                                      ? Container(
                                          height: w * 0.1,
                                          width: w * 0.225,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * 0.035)),
                                          child: Center(
                                              child: Text(
                                            "ADD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                        )
                                      : Container(
                                          height: w * 0.1,
                                          width: w * 0.225,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      w * 0.035)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    widget.b[index]
                                                        ["quantity"]++;

                                                    setState(() {});
                                                  },
                                                  child:
                                                      Icon(CupertinoIcons.add)),
                                              Text(widget.b[index]["quantity"]
                                                  .toString()),
                                              InkWell(
                                                  onTap: () {
                                                    widget.b[index]
                                                        ["quantity"]--;
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                      Icons.remove_rounded))
                                            ],
                                          ),
                                        )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    color: Colors.white,
                    child: widget.b
                            .any((item) => int.parse(item["price"]) <= 100)
                        ? ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            itemCount: widget.b.length,
                            itemBuilder: (context, index) {
                              return int.parse(widget.b[index]["price"]) <= 100
                                  ? Padding(
                                      padding: EdgeInsets.all(w * 0.02),
                                      child: Container(
                                        height: w * 0.3,
                                        width: w * 1,
                                        padding: EdgeInsets.all(w * 0.025),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(
                                                w * 0.03)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: w * 0.25,
                                              width: w * 0.28,
                                              decoration: BoxDecoration(
                                                  color: Colors.black),
                                              child: Image.file(
                                                  widget.b[index]["image"]),
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  widget.b[index]["name"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: w * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  widget.b[index]["price"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: w * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                widget.b[index]["quantity"] == 0
                                                    ? Container(
                                                        height: w * 0.1,
                                                        width: w * 0.225,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(w *
                                                                        0.035)),
                                                        child: Center(
                                                            child: Text(
                                                          "ADD",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      )
                                                    : Container(
                                                        height: w * 0.1,
                                                        width: w * 0.225,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(w *
                                                                        0.035)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  widget.b[
                                                                          index]
                                                                      [
                                                                      "quantity"]++;

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                    CupertinoIcons
                                                                        .add)),
                                                            Text(widget.b[index]
                                                                    ["quantity"]
                                                                .toString()),
                                                            InkWell(
                                                                onTap: () {
                                                                  widget.b[
                                                                          index]
                                                                      [
                                                                      "quantity"]--;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(Icons
                                                                    .remove_rounded))
                                                          ],
                                                        ),
                                                      )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox();
                            },
                          )
                        : Center(
                            child: Text("No items with price greater than 100"),
                          ),
                  ),
                  Container(
                    color: Colors.white,
                    child: widget.b
                        .any((item) => int.parse(item["price"]) <= 1000)
                        ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      itemCount: widget.b.length,
                      itemBuilder: (context, index) {
                        return int.parse(widget.b[index]["price"]) <= 1000
                            ? Padding(
                          padding: EdgeInsets.all(w * 0.02),
                          child: Container(
                            height: w * 0.3,
                            width: w * 1,
                            padding: EdgeInsets.all(w * 0.025),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                    w * 0.03)),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: w * 0.25,
                                  width: w * 0.28,
                                  decoration: BoxDecoration(
                                      color: Colors.black),
                                  child: Image.file(
                                      widget.b[index]["image"]),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.b[index]["name"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: w * 0.04,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    Text(
                                      widget.b[index]["price"],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: w * 0.04,
                                          fontWeight:
                                          FontWeight.bold),
                                    ),
                                    widget.b[index]["quantity"] == 0
                                        ? Container(
                                      height: w * 0.1,
                                      width: w * 0.225,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius
                                              .circular(w *
                                              0.035)),
                                      child: Center(
                                          child: Text(
                                            "ADD",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight
                                                    .bold),
                                          )),
                                    )
                                        : Container(
                                      height: w * 0.1,
                                      width: w * 0.225,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius
                                              .circular(w *
                                              0.035)),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                widget.b[
                                                index]
                                                [
                                                "quantity"]++;

                                                setState(
                                                        () {});
                                              },
                                              child: Icon(
                                                  CupertinoIcons
                                                      .add)),
                                          Text(widget.b[index]
                                          ["quantity"]
                                              .toString()),
                                          InkWell(
                                              onTap: () {
                                                widget.b[
                                                index]
                                                [
                                                "quantity"]--;
                                                setState(
                                                        () {});
                                              },
                                              child: Icon(Icons
                                                  .remove_rounded))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                            : const SizedBox();
                      },
                    )
                        : Center(
                      child: Text("No items with price greater than 100"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
