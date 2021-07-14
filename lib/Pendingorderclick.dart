import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:sellerapp/register.dart';

import 'Maps.dart';
import 'Models/models.dart';
import 'customerrequest.dart';
import 'notifications.dart';
import 'package:geocoder/geocoder.dart' as name;

class PendingOrdersclick extends StatefulWidget {
  @override
  _PendingOrdersclickState createState() => _PendingOrdersclickState();
}

class _PendingOrdersclickState extends State<PendingOrdersclick> {
  bool _loading = true;
  Location location;
  LocationData currentLocation;
  PolylinePoints polylinePoints;
  @override
  Future<void> didChangeDependencies() async {
    print("HII111");
    await Firestore.instance
        .collection("Users")
        .where("userUid", isEqualTo: userUid)
        .getDocuments()
        .then((value) async {
      customerDetail = CustomerDetail(
          firstname: value.documents[0]["firstName"],
          lastname: value.documents[0]["lastName"],
          userEmail: value.documents[0]["email"],
          userDocid: value.documents[0].documentID,
          userUid: value.documents[0]["userUid"],
          number: value.documents[0]["phoneNumber"],
          longitude: value.documents[0]["Longitude"],
          latitude: value.documents[0]["Latitude"]);
      coordinates = new name.Coordinates(
          value.documents[0]["Latitude"], -value.documents[0]["Longitude"]);
      address =
          await name.Geocoder.local.findAddressesFromCoordinates(coordinates);
    });
    print("HII222");

    await Firestore.instance
        .collection("ServiceRequest")
        .where("userUid", isEqualTo: userUid)
        .getDocuments()
        .then((value) async {
      docId = value.documents[0].documentID;
    });
    print("HI333");
    setState(() {
      _loading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: textcolor,
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          "Pending Order",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                //  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 90.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/female.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: textcolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    height: 500,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  "Name : ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  customerDetail.firstname +
                                      " " +
                                      customerDetail.lastname,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18),
                                ),
                              ],
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Mobile number:",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                Icon(
                                  Icons.call,
                                  size: 40.0,
                                  color: Colors.green,
                                ),
                                Text(
                                  customerDetail.number,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Email:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text(
                                customerDetail.userEmail,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Location:",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Text(
                                  address.first.featureName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Gender:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text(
                                "Female",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Service:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(),
                                child: AutoSizeText(
                                  serviceType,
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "No. of Customers: ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Text(
                                noOfCustomer,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        FlatButton.icon(
                          height: 50,
                          minWidth: 200,
                          shape: StadiumBorder(),
                          color: Colors.white,
                          onPressed: () async {
                            location = new Location();
                            polylinePoints = PolylinePoints();
                            await Firestore.instance
                                .collection("Sellers")
                                .document(userDetails.userDocid)
                                .update({
                              "Latitude": currentLocation.latitude,
                              "Longitude": currentLocation.longitude,
                            });

                            // subscribe to changes in the user's location
                            // by "listening" to the location's onLocationChanged event
                            location.onLocationChanged
                                .listen((LocationData cLoc) async {
                              // cLoc contains the lat and long of the
                              // current user's position in real time,
                              // so we're holding on to it
                              currentLocation = cLoc;
                              await Firestore.instance
                                  .collection("Sellers")
                                  .document(userDetails.userDocid)
                                  .update({
                                "Latitude": currentLocation.latitude,
                                "Longitude": currentLocation.longitude,
                              });
                            });
                            MapsLauncher.launchCoordinates(
                                customerDetail.latitude,
                                customerDetail.longitude);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MapPage()));
                          },
                          label: Text(
                            "User Location",
                            style: TextStyle(fontSize: 18),
                          ),
                          icon: Icon(Icons.map),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton.icon(
                          height: 50,
                          minWidth: 200,
                          shape: StadiumBorder(),
                          color: Colors.white,
                          onPressed: () async {
                            setState(() {
                              _loading = true;
                            });

                            await Firestore.instance
                                .collection("ServiceRequest")
                                .document(docId)
                                .update({
                              "completed": true,
                            });
                            setState(() {
                              _loading = false;
                            });
                            Navigator.pop(context);
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          label: Text(
                            "Mark As Completed",
                            style: TextStyle(fontSize: 18),
                          ),
                          icon: Icon(Icons.done),
                        ),
                        SizedBox(
                          height: 20,
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
