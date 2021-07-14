import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'forgot Password',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              SizedBox(height: 80),
              Image(
                image: AssetImage('assets/logooo.png'),
                height: 150,
              ),
              SizedBox(height: 60),
              Opacity(
                opacity: 0.8,
                child: Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Column(
                    children: [
                      _textInput(emailController, 'Email Address', Icons.email),
                      SizedBox(height: 60),
                      Container(
                        child: _loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : RaisedButton(
                                padding: EdgeInsets.fromLTRB(80, 2, 80, 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                color: textcolor,
                                textColor: Colors.white,
                                child: Text(
                                  'Send Code',
                                  style: TextStyle(fontSize: 17),
                                ),
                                onPressed: () {
                                  if (emailController.text != '' &&
                                      emailController.text.contains("@") !=
                                          false) {
                                    setState(() {
                                      _loading = true;
                                    });
                                    _auth
                                        .sendPasswordResetEmail(
                                            email: emailController.text)
                                        .whenComplete(() => {
                                              showDialog(
                                                  context: context,
                                                  child: AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    18.0),
                                                            side: BorderSide(
                                                              color: textcolor,
                                                            )),
                                                    title: Text(
                                                        "Password reset link sent to " +
                                                            emailController
                                                                .text),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .orange),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  )),
                                              setState(() {
                                                _loading = false;
                                              }),
                                            })
                                        .catchError((e) {
                                      showDialog(
                                          context: context,
                                          child: AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        18.0),
                                                side: BorderSide(
                                                  color: textcolor,
                                                )),
                                            title: Text(e),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  "OK",
                                                  style: TextStyle(
                                                      color: textcolor),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ));
                                    });
                                  } else {
                                    showDialog(
                                        context: context,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      18.0),
                                              side: BorderSide(
                                                color: textcolor,
                                              )),
                                          title: Text("Invalid Email"),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                "OK",
                                                style:
                                                    TextStyle(color: textcolor),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        ));
                                  }
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ));
  }
}

Widget _textInput(controller, String label, IconData icon) {
  return Container(
    height: 60,
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.black)),
    ),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        border: InputBorder.none,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: textcolor,
        ),
      ),
    ),
  );
}
