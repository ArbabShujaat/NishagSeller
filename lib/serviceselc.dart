import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sellerapp/Biodata.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/pricing/Heenapricing.dart';
import 'package:sellerapp/pricing/Photographypricing.dart';
import 'package:sellerapp/pricing/Videographypricing.dart';
import 'package:sellerapp/pricing/hairdresspricing.dart';
import 'package:sellerapp/pricing/makeuppricing.dart';
import 'package:sellerapp/pricing/massagepricing.dart';
import 'package:sellerapp/pricing/pedicurepricing.dart';
import 'package:sellerapp/pricing/taxipricing.dart';
import 'package:sellerapp/register.dart';

class Serviceselection extends StatefulWidget {
  @override
  _ServiceselectionState createState() => _ServiceselectionState();
}

class _ServiceselectionState extends State<Serviceselection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select your service"),
        backgroundColor: textcolor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Select any Service",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textcolor),
                ),
                CustomScrollView(shrinkWrap: true, primary: false, slivers: <
                    Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(0.0),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceType = "Makeup";
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Makeuppricing()));
                          },
                          child: Card(
                            color: textcolor,
                            margin: EdgeInsets.all(30.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                                child: Text(
                              "Makeup",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                serviceType = "Hair Dressing";
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Hairdresspricing()));
                            },
                            child: Card(
                              color: textcolor,
                              margin: EdgeInsets.all(30.0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text(
                                "Hair Dressing",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                            )),
                        InkWell(
                            onTap: () {
                              setState(() {
                                serviceType = "Massage service";
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Massagepricing()));
                            },
                            child: Card(
                              color: textcolor,
                              margin: EdgeInsets.all(30.0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text(
                                "Massage service",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceType = "Heena";
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Heenapricing()));
                          },
                          child: Card(
                              color: textcolor,
                              margin: EdgeInsets.all(30.0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text(
                                "Heena",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center,
                              ))),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                serviceType = "Pedicure & Manicure";
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pedicurepricing()));
                            },
                            child: Card(
                              color: textcolor,
                              margin: EdgeInsets.all(30.0),
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                  child: Text(
                                "Pedicure & Manicure",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceType = "Photography";
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Photographypricing()));
                          },
                          child: Card(
                            color: textcolor,
                            margin: EdgeInsets.all(30.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                                child: Text(
                              "Photography",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceType = "Taxi Services";
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Taxipricing()));
                          },
                          child: Card(
                            color: textcolor,
                            margin: EdgeInsets.all(30.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                                child: Text(
                              "Taxi Services",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              serviceType = "Videography";
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Videographypricing()));
                          },
                          child: Card(
                            color: textcolor,
                            margin: EdgeInsets.all(30.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Center(
                                child: Text(
                              "Videography",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ]),
        ),
      ),
    );
  }
}
