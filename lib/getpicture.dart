import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/biodata.dart';

import 'package:sellerapp/register.dart';

class GetProfilepic extends StatefulWidget {
  @override
  _GetProfilepicState createState() => _GetProfilepicState();
}

class _GetProfilepicState extends State<GetProfilepic> {
  File imagefile;
  File _image;
  bool signupLoading = false;
  bool imagecheck = false;
  bool piccheck = false;
  bool postLoading = false;
  String imageUrl;

  _openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefile = picture;
    });
  }

  _openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefile = picture;
    });
  }

  Future<void> _showdialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Take a Picture"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: () async {
                      _image = await pickImage(context, ImageSource.gallery);
                      setState(() {
                        piccheck = true;
                      });
                      if (_image != null) {
                        final FirebaseStorage _storgae = FirebaseStorage(
                            storageBucket:
                                'gs://don-t-go-to-prison.appspot.com/');
                        StorageUploadTask uploadTask;
                        String filePath = '${DateTime.now()}.png';
                        uploadTask =
                            _storgae.ref().child(filePath).putFile(_image);
                        uploadTask.onComplete.then((_) async {
                          print(1);
                          String url1 = await uploadTask.lastSnapshot.ref
                              .getDownloadURL();
                          _image.delete().then((onValue) {
                            print(2);
                          });
                          setState(() {
                            imagecheck = true;
                          });
                          print(url1);

                          profilePic = url1;
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Open Galley"),
                  ),
                  Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    onTap: () async {
                      _image = await pickImage(context, ImageSource.camera);
                      setState(() {
                        piccheck = true;
                      });
                      if (_image != null) {
                        final FirebaseStorage _storgae = FirebaseStorage(
                            storageBucket:
                                'gs://don-t-go-to-prison.appspot.com');
                        StorageUploadTask uploadTask;
                        String filePath = '${DateTime.now()}.png';
                        uploadTask =
                            _storgae.ref().child(filePath).putFile(_image);
                        uploadTask.onComplete.then((_) async {
                          print(1);
                          String url1 = await uploadTask.lastSnapshot.ref
                              .getDownloadURL();
                          _image.delete().then((onValue) {
                            print(2);
                          });
                          setState(() {
                            imagecheck = true;
                          });
                          print(url1);

                          profilePic = url1;
                        });
                      }
                      Navigator.pop(context);
                    },
                    child: Text("Open Camera"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Profile Picture",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: textcolor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(00.0),
          child: new Theme(
              data: new ThemeData(
                primaryColor: Colors.red,
                primaryColorDark: textcolor,
              ),
              child: (_image != null)
                  ? Image.file(
                      _image,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: textcolor, width: 2),
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 600,
                      height: 400,
                      margin: EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Upload Your Profile Picture",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: textcolor),
                          ),
                          IconButton(
                              alignment: Alignment.bottomLeft,
                              icon: Icon(
                                Icons.camera_enhance,
                                color: textcolor,
                                size: 40,
                              ),
                              onPressed: () {
                                _showdialogbox(context);
                              })
                        ],
                      ))),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: textcolor,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (imagecheck) {
            print("Hi");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Biodata()));
          } else {
            imagecheck == false
                ? showDialog(
                    context: context,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Colors.red[400],
                          )),
                      title: Text("Wait..."),
                      content: Text("Image Not Uploaded"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.red[400]),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ))
                : Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Biodata()));
          }
        },
      ),
    );
  }
}

Future<File> pickImage(BuildContext context, ImageSource source) async {
  File selected = (await ImagePicker.pickImage(
    source: source,
    imageQuality: 20,
  )) as File;
  return selected;
}
