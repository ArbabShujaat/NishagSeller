import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sellerapp/Models/Controllers.dart';
import 'package:sellerapp/description.dart';

import 'package:sellerapp/register.dart';

class Phonenumber extends StatefulWidget {
  @override
  _PhonenumberState createState() => _PhonenumberState();
}

class _PhonenumberState extends State<Phonenumber> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Enter your KRA code",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: textcolor),
      body: Form(
        key: _formKey,
        child: Center(
            child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  "Please Enter your KRA Pincode",
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: textcolor)),
                        child: TextFormField(
                          controller: signupKRAPinCodecontroller,
                          textAlign: TextAlign.center,
                          decoration: new InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: textcolor)),
                            hintText: "Add KRA Pincode",
                            hintStyle: TextStyle(
                                color: textcolor, fontWeight: FontWeight.bold),
                          ),
                          keyboardType: TextInputType.phone,
                          style: new TextStyle(
                            color: textcolor,
                            fontFamily: "Poppins",
                          ),
                          validator: (String val) {
                            if (val.trim().isEmpty) {
                              return "Field must not be empty";
                            }
                            return null;
                          },
                        ))),
              ],
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: textcolor,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Description()));
          }
        },
      ),
    );
  }
}
