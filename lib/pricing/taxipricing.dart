import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/login.dart';

import '../getpicture.dart';

class Taxipricing extends StatefulWidget {
  @override
  _TaxipricingState createState() => _TaxipricingState();
}

class _TaxipricingState extends State<Taxipricing> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: textcolor,
          title: Text("Taxi Services Pricing"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: TextFormField(
                    controller: small,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Small - KES 320",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: textcolor,
                            fontWeight: FontWeight.w400),
                        hintMaxLines: 1),
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: textcolor,
                      fontSize: 18,
                    ),
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                  )),
              Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: TextFormField(
                    controller: eleven,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "XI - KES 400",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: textcolor,
                            fontWeight: FontWeight.w400),
                        hintMaxLines: 1),
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: textcolor,
                      fontSize: 18,
                    ),
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                  )),
              Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: TextFormField(
                    controller: carNormal,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Car Hire Normal - KES 1,500",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: textcolor,
                            fontWeight: FontWeight.w400),
                        hintMaxLines: 1),
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: textcolor,
                      fontSize: 18,
                    ),
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                  )),
              Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: TextFormField(
                    controller: carBridal,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Car Hire for Bridal - KES 7,000",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: textcolor,
                            fontWeight: FontWeight.w400),
                        hintMaxLines: 1),
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                      color: textcolor,
                      fontSize: 18,
                    ),
                    validator: (String val) {
                      if (val.trim().isEmpty) {
                        return "Field must not be empty";
                      }
                      return null;
                    },
                  )),
              MaterialButton(
                minWidth: 200,
                height: 50,
                shape: StadiumBorder(),
                color: textcolor,
                onPressed: () {
                  if (_formKey.currentState.validate())
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GetProfilepic()));
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ));
  }
}
