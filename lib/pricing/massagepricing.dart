import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/login.dart';

import '../getpicture.dart';

class Massagepricing extends StatefulWidget {
  @override
  _MassagepricingState createState() => _MassagepricingState();
}

class _MassagepricingState extends State<Massagepricing> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: textcolor,
          title: Text("Massage Pricing"),
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
                    controller: deepTissue,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Deep Tissue Massage - KES 5,000",
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
                    controller: swedish,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Swedish Massage KES 4,500",
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
                    controller: prenatal,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Pre-natal Massage KES 6,500",
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
                    controller: backneckshoukder,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Back,Neck & Shoulders - KES 3,500",
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
