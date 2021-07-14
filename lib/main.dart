import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sellerapp/Homescreen.dart';
import 'package:sellerapp/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/models.dart';
import 'PushNotification/FirebasePushNotificatiom.dart';
import 'PushNotification/TokemModel.dart';

FirebasePushNotificationService pushNotificationService =
    FirebasePushNotificationService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

final Color background = Color(0xFFFDDBED);
final FirebaseMessaging _fcm = FirebaseMessaging();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    pushNotificationService.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nisah App',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocationData _locationData;
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () async {
      await Firestore.instance
          .collection("About Us")
          .getDocuments()
          .then((value) async => {
                aboutUs = value.documents[0]["aboutUs"],
              });

      await Firestore.instance
          .collection("Contact Us")
          .getDocuments()
          .then((value) async => {
                contactUs = value.documents[0]["PhoneNumber"],
              });
      var prefs = await SharedPreferences.getInstance();

      if (prefs.containsKey("userDataSeller")) {
        final extractedUserData = json.decode(prefs.getString('userDataSeller'))
            as Map<String, Object>;
        Location location = new Location();

        bool _serviceEnabled;
        PermissionStatus _permissionGranted;

        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            showDialog(
                context: context,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.red[400],
                      )),
                  title: Text(
                      "Turn on the location and grant location permission."),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        return 0;
                      },
                    )
                  ],
                ));
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            showDialog(
                context: context,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.red[400],
                      )),
                  title: Text(
                      "Turn on the location and grant location permission."),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.red[400]),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        return 0;
                      },
                    )
                  ],
                ));
          }
        }

        _locationData = await location.getLocation();

        String docid = "";

        print(extractedUserData['userEmail']);
        await Firestore.instance
            .collection("Sellers")
            .where("email", isEqualTo: extractedUserData['userEmail'])
            .getDocuments()
            .then((value) async => {
                  docid = value.documents[0].documentID,
                });

        await Firestore.instance.collection("Sellers").document(docid).update({
          "Latitude": _locationData.latitude,
          "Longitude": _locationData.longitude
        });

        await Firestore.instance
            .collection("Sellers")
            .where("email", isEqualTo: extractedUserData['userEmail'])
            .getDocuments()
            .then((value) => {
                  userDetails = UserDetails(
                      latitude: value.documents[0]["Latitude"],
                      longitude: value.documents[0]["Longitude"],
                      approved: value.documents[0]["approved"],
                      userEmail: value.documents[0]["email"],
                      userDocid: value.documents[0].documentID,
                      userUid: value.documents[0]["userUid"],
                      descripton: value.documents[0]["description"],
                      kraPincode: value.documents[0]["kraPin"],
                      certificatePic: value.documents[0]["goodConductPic"],
                      // location: value.documents[0]["email"],
                      idCardPic: value.documents[0]["idCardPic"],
                      notificationOpened: value.documents[0]
                          ["notificationOpened"],
                      firstname: value.documents[0]["firstName"],
                      lastname: value.documents[0]["lastName"],
                      userpic: value.documents[0]["profilePic"],
                      gender: value.documents[0]["gender"],
                      number: value.documents[0]["phoneNumber"],
                      service: value.documents[0]["serviceType"])
                });
        String fcmToken = await _fcm.getToken();
        final tokenRef = FirebaseFirestore.instance
            .collection("Sellers")
            .doc(userDetails.userDocid)
            .collection('tokens')
            .doc(fcmToken);
        await tokenRef.set(
          TokenModel(token: fcmToken, createdAt: FieldValue.serverTimestamp())
              .toJson(),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Image(
          width: 350,
          image: AssetImage(
            "assets/logooo.png",
          ),
        )));
  }
}
