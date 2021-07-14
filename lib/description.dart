import 'dart:convert';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sellerapp/Homescreen.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/Models/models.dart';
import 'package:location/location.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:sellerapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool buttonLoading = false;
  LocationData _locationData;
  Future<void> _showdialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Column(
                children: [
                  Text(
                    "NOTE",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "Thank you for choosing NisahServices.\nAfter reviewing your provided info,We will let you know about approval using email or contact number \n(with in 24 hours)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: textcolor,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              content: MaterialButton(
                color: textcolor,
                minWidth: 250,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "OK",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ));
        });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Enter your description&pricing",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: textcolor,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Description for your profile",
                  style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: new ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 300.0,
                    ),
                    child: TextFormField(
                      controller: signupDescriptioncontroller,
                      minLines: 1,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Add your Description",
                        hintStyle: TextStyle(
                            color: textcolor, fontWeight: FontWeight.bold),
                      ),
                      keyboardType: TextInputType.multiline,
                      style: new TextStyle(
                        color: textcolor,
                        fontSize: 18,
                        fontFamily: "Poppins",
                      ),
                      validator: (String val) {
                        if (val.trim().isEmpty) {
                          return "Field must not be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  minWidth: 200,
                  height: 50,
                  shape: StadiumBorder(),
                  color: textcolor,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        buttonLoading = true;
                      });
                      await signUpUser();
                      setState(() {
                        buttonLoading = false;
                      });
                    }
                  },
                  child: buttonLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUpUser() async {
    print("iam hre");
    print(serviceType);
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    if (serviceType == "Makeup")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "profilePic": profilePic,
        "idCardPic": idCardPic,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "goodConductPic": goodConductPic,
        "gender": "female",
        "serviceType": "Makeup",
        "notificationOpened": true,
        "Rating": 0,
        "numberOfReviews": 0,
        "removed": false,
        "bridalMakeUp": bridalMakeUpcontroller.text,
        "bridesmaidMakeUp": bridesmaidMakeUp.text,
        "makeupLashes": makeupLashes.text,
        "makeup": makeup.text,
      });

    if (serviceType == "Hair Dressing")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "profilePic": profilePic,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "idCardPic": idCardPic,
        "goodConductPic": goodConductPic,
        "serviceType": "Hair Dressing",
        "notificationOpened": true,
        "Rating": 0,
        "numberOfReviews": 0,
        "hairBridal": hairBridal.text,
        "gender": "female",
        "removed": false,
        "wigLines": wigLines.text,
        "wigInstallation": wigInstallation.text,
        "mediumBraiding": mediumBraiding.text,
        "smallBraiding": smallBraiding.text,
        "largeBraiding": largeBraiding.text,
        "washAndBlowDraw": washAndBlowDraw.text,
      });

    if (serviceType == "Massage service")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "notificationOpened": true,
        "profilePic": profilePic,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "idCardPic": idCardPic,
        "Rating": 0,
        "numberOfReviews": 0,
        "removed": false,
        "goodConductPic": goodConductPic,
        "serviceType": "Massage service",
        "deepTissue": deepTissue.text,
        "gender": "female",
        "swedish": swedish.text,
        "prenatal": prenatal.text,
        "backneckshoukder": backneckshoukder.text,
      });

    if (serviceType == "Heena")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "description": signupDescriptioncontroller.text,
        "notificationOpened": true,
        "profilePic": profilePic,
        "idCardPic": idCardPic,
        "removed": false,
        "goodConductPic": goodConductPic,
        "serviceType": "Heena",
        "Rating": 0,
        "numberOfReviews": 0,
        "bridal": bridal.text,
        "gender": "female",
        "hands": hands.text,
        "handsAndLegs": handsAndLegs.text,
      });

    if (serviceType == "Pedicure & Manicure")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "notificationOpened": true,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "profilePic": profilePic,
        "removed": false,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "idCardPic": idCardPic,
        "goodConductPic": goodConductPic,
        "serviceType": "Pedicure & Manicure",
        "meniCurePandG": meniCurePandG.text,
        "meniCureP": meniCureP.text,
        "Rating": 0,
        "numberOfReviews": 0,
        "gender": "female",
        "pediCurePandG": pediCurePandG.text,
        "pediCureP": pediCureP.text,
      });

    if (serviceType == "Photography")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "lastName": signupLastNamecontroller.text,
        "notificationOpened": true,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "profilePic": profilePic,
        "idCardPic": idCardPic,
        "goodConductPic": goodConductPic,
        "serviceType": "Photography",
        "wedding": wedding.text,
        "removed": false,
        "gender": "female",
        "individual": individual.text,
        "Rating": 0,
        "numberOfReviews": 0,
        "family": family.text,
        "commercial": commercial.text,
      });

    if (serviceType == "Taxi Services")
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "notificationOpened": true,
        "kraPin": signupKRAPinCodecontroller.text,
        "description": signupDescriptioncontroller.text,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "profilePic": profilePic,
        "idCardPic": idCardPic,
        "goodConductPic": goodConductPic,
        "serviceType": "Taxi Services",
        "small": small.text,
        "Rating": 0,
        "numberOfReviews": 0,
        "gender": "female",
        "eleven": eleven.text,
        "removed": false,
        "carNormal": carNormal.text,
        "carBridal": carBridal.text,
      });

    if (serviceType == "Videography") {
      await Firestore.instance.collection("Sellers").add({
        "email": signupEmailcontroller.text,
        "userUid": signupUser.uid,
        "approved": false,
        "firstName": signupFirstNamecontroller.text,
        "lastName": signupLastNamecontroller.text,
        "phoneNumber": signupNumbercontroller.text,
        "kraPin": signupKRAPinCodecontroller.text,
        "notificationOpened": true,
        "description": signupDescriptioncontroller.text,
        "profilePic": profilePic,
        "idCardPic": idCardPic,
        "Longitude": _locationData.longitude,
        "Latitude": _locationData.latitude,
        "goodConductPic": goodConductPic,
        "Rating": 0,
        "numberOfReviews": 0,
        "removed": false,
        "serviceType": "Videography",
        "vwedding": vwedding.text,
        "gender": "female",
        "vindividual": vindividual.text,
        "vcommercial": vcommercial.text,
      });
    }
    print(signupEmailcontroller.text);
    print(signupUser.uid);
    await Firestore.instance
        .collection("Sellers")
        .where("email", isEqualTo: signupEmailcontroller.text)
        .getDocuments()
        .then((value) => {
              userDetails = UserDetails(
                  notificationOpened: value.documents[0]["notificationOpened"],
                  approved: value.documents[0]["approved"],
                  userEmail: value.documents[0]["email"],
                  userDocid: value.documents[0].documentID,
                  userUid: value.documents[0]["userUid"],
                  latitude: value.documents[0]["Latitude"],
                  longitude: value.documents[0]["Longitude"],
                  descripton: value.documents[0]["description"],
                  kraPincode: value.documents[0]["kraPin"],
                  certificatePic: value.documents[0]["goodConductPic"],
                  // location: value.documents[0]["email"],
                  idCardPic: value.documents[0]["idCardPic"],
                  firstname: value.documents[0]["firstName"],
                  lastname: value.documents[0]["lastName"],
                  userpic: value.documents[0]["profilePic"],
                  gender: value.documents[0]["gender"],
                  number: value.documents[0]["phoneNumber"],
                  service: value.documents[0]["serviceType"])
            });

    var prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {
        'userEmail': signupUser.email,
        'userUid': signupUser.uid,
      },
    );
    prefs.setString('userDataSeller', userData);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
