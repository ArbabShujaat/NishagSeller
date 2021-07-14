import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/getpicture.dart';
import 'package:sellerapp/login.dart';

class Hairdresspricing extends StatefulWidget {
  @override
  _HairdresspricingState createState() => _HairdresspricingState();
}

class _HairdresspricingState extends State<Hairdresspricing> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: textcolor,
          title: Text("HairDressing Pricing"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(20.0),
                    decoration:
                        BoxDecoration(border: Border.all(color: textcolor)),
                    child: TextFormField(
                      controller: hairBridal,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Bridal - KES 15,000",
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
                      controller: wigLines,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Wig Lines - KES,700",
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
                      controller: wigInstallation,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Wig Installation- KES 4,500",
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
                      controller: smallBraiding,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Small Braiding- KES 1,000",
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
                      controller: mediumBraiding,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Medium Braiding- KES 1,500",
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
                      controller: largeBraiding,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Large Braiding- KES 2,000",
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
                      controller: washAndBlowDraw,
                      textAlign: TextAlign.center,
                      decoration: new InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: textcolor)),
                          hintText: "Wash & Blow dry- KES 1,500",
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
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetProfilepic()));
                    }
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
          ),
        ));
  }
}
