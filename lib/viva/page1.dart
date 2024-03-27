import 'dart:io';

import 'package:crud/color_page.dart';
import 'package:crud/viva/page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../image_page.dart';
import '../main.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
  var file;
  pickFile(ImageSource) async {
    final pickedFile=await ImagePicker.platform.pickImage(source:ImageSource);
    file=File(pickedFile!.path);
    if(mounted){
      setState(() {
        file=File(pickedFile.path);
      });
    }
  }

  List<Map<String,dynamic>> a = [];

  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController quantityController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w*0.03),
                ),
                label: Text("Product Name")
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: priceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w*0.03),
                ),
                label: Text("Price")
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: quantityController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(w*0.03),
                ),
                label: Text("Quantity")
              ),
            ),
            InkWell(
              onTap: () {
                // a.add({
                //   "name" : nameController.text,
                //   "price" : priceController.text,
                //   "quantity" : quantityController.text,
                //   "image" : file
                // });

                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    quantityController.text.isNotEmpty &&
                    file != null && file is File && file.existsSync()) {
                  a.add({
                    "name": nameController.text,
                    "price": priceController.text,
                    "quantity": quantityController.text,
                    "image": file,
                  });

                  if (a.length > 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page2(b: a)),
                    );
                  } else {
                    nameController.clear();
                    priceController.clear();
                    quantityController.clear();
                    file=null;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter at least 5 items")),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please fill in all fields and select an image")),
                  );
                }
                setState(() {

                });
              },
              child: Container(
                height: w*0.125,
                width: w*0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.05),
                  color: Colors.black
                ),
                child: Center(
                  child: Text("Submitt",
                  style: TextStyle(
                    fontSize: w*0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
