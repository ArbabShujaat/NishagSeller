import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/getpicture.dart';
import 'package:sellerapp/login.dart';

class Makeuppricing extends StatefulWidget {
  @override
  _MakeuppricingState createState() => _MakeuppricingState();
}

class _MakeuppricingState extends State<Makeuppricing> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: textcolor,
          title: Text("Makeup Pricing"),
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
                    textAlign: TextAlign.center,
                    controller: bridalMakeUpcontroller,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText:
                            "Bridal Makeup - Price will be a maximum of \nKES 15,000",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            color: textcolor,
                            fontWeight: FontWeight.w400),
                        hintMaxLines: 2),
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
                    controller: bridesmaidMakeUp,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Bridesmaid Makeup - Price will be KES 2,000",
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
                    controller: makeupLashes,
                    textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Simple Makeup with Lashes- KES 1,500",
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
                    textAlign: TextAlign.center,
                    controller: makeup,
                    decoration: new InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: textcolor)),
                        hintText: "Simple Makeup without Lashes- KES 1,000",
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
