import 'package:flutter/material.dart';
import 'package:sellerapp/Models/models.dart';
import 'package:sellerapp/about.dart';
import 'package:sellerapp/complaint.dart';
import 'package:sellerapp/register.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: textcolor,
          title: Text("Help"),
        ),
        body: help());
  }

  Widget help() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
            },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "About Us",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: textcolor),
              ),
            )),
        Divider(
          thickness: 1,
          color: textcolor,
        ),
        GestureDetector(
            onTap: () {
              launch('tel:$contactUs');
            },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Contact Us",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: textcolor),
              ),
            )),
        Divider(
          thickness: 1,
          color: textcolor,
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ComplaintScreen()));
            },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Complain/Suggestion",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: textcolor),
              ),
            )),
        Divider(
          thickness: 1,
          color: textcolor,
        )
      ],
    );
  }
}
