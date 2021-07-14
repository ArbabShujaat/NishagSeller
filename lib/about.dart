import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sellerapp/Models/models.dart';
import 'package:sellerapp/register.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: textcolor,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          aboutUs,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
