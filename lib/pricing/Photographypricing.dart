import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/login.dart';

import '../getpicture.dart';

class Photographypricing extends StatefulWidget {
  @override
  _PhotographypricingState createState() => _PhotographypricingState();
}

class _PhotographypricingState extends State<Photographypricing> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: textcolor,
          title: Text("Photography Pricing"),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: textcolor)),
                  child: TextFormField(
                    controller: wedding,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Wedding - KES 15,000",
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
                    controller: individual,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Individual-  KES 3,500",
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
                    controller: family,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Family- KES 10,000",
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
                    controller: commercial,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Commercial - KES 10,000",
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
