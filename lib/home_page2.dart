import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/add_user.dart';
import 'package:crud/color_page.dart';
import 'package:crud/data_pass.dart';
import 'package:crud/edit_user.dart';
import 'package:crud/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_page.dart';
import 'main.dart';

class homePage2 extends StatefulWidget {
  const homePage2({super.key});

  @override
  State<homePage2> createState() => _homePage2State();
}

class _homePage2State extends State<homePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => adduserPage (),));
        },
        backgroundColor: color.fifthColor,
        child: Icon(CupertinoIcons.add,
        color: color.secondaryColor),
      ),
      backgroundColor: color.secondaryColor,
      appBar: AppBar(
        backgroundColor: color.secondaryColor,
        title: Text("Hello, User",
            style: TextStyle(
                color: color.thirdColor,
                fontSize: w*0.06
            )),
        actions: [
          CircleAvatar(
            radius: w*0.1,
            backgroundImage: AssetImage(ImagePage.beckham),
          ),
          SizedBox(width: w*0.02,),
          Icon(Icons.logout,
            color: color.thirdColor,
            size: w*0.08,),
          SizedBox(width: w*0.03,),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current Users",
            style: TextStyle(
              fontSize:w*0.06,
              color: color.thirdColor,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(height: w*0.04,),
            // Expanded(
            //   child: StreamBuilder(
            //     stream: FirebaseFirestore.instance.collection("Students").doc("shamilmohammed986@gmail.com").snapshots(),
            //     builder: (context, snapshot) {
            //       if(snapshot.hasData){
            //         var documentData = snapshot.data!.data();
            //         String name = documentData?['name'];
            //         String email= documentData?['email'];
            //         String password = documentData?['password'];
            //         return Column(
            //           children: [
            //             Text(name),
            //             Text(email),
            //             Text(password)
            //           ],
            //         );
            //       }else{
            //         return const CircularProgressIndicator();
            //       }
            //
            //
            //     }
            //   ),
            // )
              Expanded(
                child: StreamBuilder<List<UsersModel>>(
                  stream: FirebaseFirestore.instance.collection("user").snapshots().map((event) => event.docs.map((e) => UsersModel.fromMap(e.data())).toList()),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Text("No Document Found");
                    }
                    var data = snapshot.data!;
                    return data.length==0?
                        Text("No User found")
                    :  ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => dataPass(id: data[index].id.toString(),),));
                        },
                        child: Container(
                          height: w*0.25,
                          width: w*0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color: color.fourthColor
                          ),
                          margin: EdgeInsets.only(bottom: w*0.03),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: w*0.07,
                                    backgroundColor: color.secondaryColor,
                                  ),
                                  title: Text(data[index].name.toString(),style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: w*0.045,
                                      color: color.thirdColor
                                  )),
                                  subtitle: Text(data[index].email.toString(),style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    fontSize: w*0.032,
                                    color: color.thirdColor,
                                  )),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: w*0.03),
                                child:Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCupertinoDialog(
                                            context: context,
                                            builder: ((context) => CupertinoAlertDialog(
                                              content: Text(" Are You Sure \n You Want to Delete User?",
                                                  style: TextStyle(
                                                      fontSize: w*0.04)),
                                              actions:[
                                                CupertinoDialogAction(
                                                  child: Text("Yes"),
                                                  isDestructiveAction: true,
                                                  onPressed: () {
                                                    FirebaseFirestore.instance.collection("user").doc(data[index].id.toString()).delete();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                CupertinoDialogAction(
                                                  child: Text("Cancel"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                SizedBox(height: w*0.0001)
                                              ],
                                            )) );
                                      },
                                        child: Icon(CupertinoIcons.delete,color: Colors.red,size: w*0.06)),
                                    SizedBox(width: w*0.01,),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => edituserPage (

                                          edit: data[index],),));
                                      },
                                        child: Icon(Icons.edit_outlined,color: Colors.blue,size: w*0.06))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox();
            },
            );
                  }
                ),
              ),
          ],
        ),
      ),
    );
  }
}
