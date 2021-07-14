import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sellerapp/serviceselc.dart';

import 'Models/Controllers.dart';

final Color textcolor = Color.fromRGBO(235, 144, 110, 30);

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool monVal = true;
  bool tuVal = true;
  bool buttonLoading = false;

  final TextEditingController _controller = new TextEditingController();
  var items = [
    'Dubai',
    'India',
    'Australia',
    'Pakistan',
  ];
  final _formKey = GlobalKey<FormState>();
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Sign Up"),
          backgroundColor: textcolor,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "Enter Your first name",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: signupFirstNamecontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "First name must not be empty";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "Enter Your last name",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: signupLastNamecontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "Last name must not be empty";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.call,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "+9x xxxx xxxx",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.phone,
                            controller: signupNumbercontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "Phone number must not be empty";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: signupEmailcontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "Email must not be empty";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.multiline,
                            controller: signupPasswordcontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "Password must not be empty";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: new Theme(
                          data: new ThemeData(
                            primaryColor: textcolor,
                            primaryColorDark: textcolor,
                          ),
                          child: TextFormField(
                            decoration: new InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 30,
                                color: textcolor,
                              ),
                              hintText: "Re-enter your password",
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: textcolor,
                              ),
                              fillColor: textcolor,
                            ),
                            keyboardType: TextInputType.multiline,
                            controller:
                                signupConfirmPassworddDescriptioncontroller,
                            validator: (String val) {
                              if (val.trim().isEmpty) {
                                return "Password must not be empty";
                              }
                              if (val.trim() != signupPasswordcontroller.text) {
                                return "Password doesnot match";
                              }
                              return null;
                            },
                            style: new TextStyle(
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          )),
                    )),
                // Padding(
                //     padding: EdgeInsets.all(10.0),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //       ),
                //       child: new Theme(
                //           data: new ThemeData(
                //             primaryColor: textcolor,
                //             primaryColorDark: textcolor,
                //           ),
                //           child: TextField(
                //             readOnly: true,
                //             controller: signupLocationcontroller,
                //             decoration: InputDecoration(
                //               hintText: "Location",
                //               hintStyle: TextStyle(
                //                 fontSize: 18,
                //                 color: textcolor,
                //               ),
                //               prefixIcon: Icon(
                //                 Icons.add_location,
                //                 size: 30,
                //                 color: textcolor,
                //               ),
                //               suffixIcon: PopupMenuButton<String>(
                //                 icon: const Icon(Icons.arrow_drop_down),
                //                 onSelected: (String value) {
                //                   signupLocationcontroller.text = value;
                //                 },
                //                 itemBuilder: (BuildContext context) {
                //                   return items.map<PopupMenuItem<String>>(
                //                       (String value) {
                //                     return new PopupMenuItem(
                //                         child: new Text(
                //                           value,
                //                           style: TextStyle(color: textcolor),
                //                         ),
                //                         value: value);
                //                   }).toList();
                //                 },
                //               ),
                //             ),
                //           )),
                //     )),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            color: textcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Text(
                          //   "Male",
                          //   style: TextStyle(
                          //       color: textcolor, fontWeight: FontWeight.bold),
                          // ),
                          // Radio(
                          //   activeColor: textcolor,
                          //   value: 1,
                          //   groupValue: selectedRadio,
                          //   onChanged: (val) {
                          //     print("Radio $val");
                          //     setSelectedRadio(val);
                          //   },
                          // ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // [Tuesday] checkbox
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Female",
                            style: TextStyle(
                                color: textcolor, fontWeight: FontWeight.bold),
                          ),
                          Radio(
                            activeColor: textcolor,
                            value: 1,
                            groupValue: 1,
                            onChanged: (val) {
                              print("Radio $val");
                              setSelectedRadio(val);
                            },
                          ),
                        ],
                      ),
                      // [Wednesday] checkbox
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () async {
                        setState(() {
                          buttonLoading = true;
                        });
                        if (_formKey.currentState.validate()) {
                          await signUp(context);
                        }
                        setState(() {
                          buttonLoading = false;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(235, 144, 110, 30),
                                Color(0xFF57AFB6)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 60.0),
                          alignment: Alignment.center,
                          child: buttonLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text(
                                  "SAVE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    )),
              ])),
        ));
  }
}

Future<void> signUp(BuildContext context) async {
  try {
    signupUser = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signupEmailcontroller.text,
      password: signupPasswordcontroller.text,
    ))
        .user;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Serviceselection()));

    return 0;
  } catch (signUpError) {
    // setState(() {
    //   signupLoading = false;
    // });

    print("Hiiiii1");
    showDialog(
        context: context,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0),
              side: BorderSide(
                color: Colors.red[400],
              )),
          title: Text(signUpError.toString()),
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
