import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User signupUser;
String profilePic;
String idCardPic;
String goodConductPic;
String serviceType = "";

final TextEditingController signupFirstNamecontroller =
    new TextEditingController();
final TextEditingController signupLastNamecontroller =
    new TextEditingController();
final TextEditingController signupNumbercontroller =
    new TextEditingController();
final TextEditingController signupEmailcontroller = new TextEditingController();
final TextEditingController signupKRAPinCodecontroller =
    new TextEditingController();
final TextEditingController signupDescriptioncontroller =
    new TextEditingController();
final TextEditingController signupPasswordcontroller =
    new TextEditingController();
final TextEditingController signupConfirmPassworddDescriptioncontroller =
    new TextEditingController();
final TextEditingController signupLocationcontroller =
    new TextEditingController();

///////Services Controller

////BridalMakeup
final TextEditingController bridalMakeUpcontroller =
    new TextEditingController();
final TextEditingController bridesmaidMakeUp = new TextEditingController();
final TextEditingController makeupLashes = new TextEditingController();
final TextEditingController makeup = new TextEditingController();

//Heena
final TextEditingController bridal = new TextEditingController();
final TextEditingController hands = new TextEditingController();
final TextEditingController handsAndLegs = new TextEditingController();

//PedicureAndMedicure
final TextEditingController meniCurePandG = new TextEditingController();
final TextEditingController meniCureP = new TextEditingController();
final TextEditingController pediCurePandG = new TextEditingController();
final TextEditingController pediCureP = new TextEditingController();

//Phototgraphy
final TextEditingController wedding = new TextEditingController();
final TextEditingController individual = new TextEditingController();
final TextEditingController family = new TextEditingController();
final TextEditingController commercial = new TextEditingController();

//TaxiService
final TextEditingController small = new TextEditingController();
final TextEditingController eleven = new TextEditingController();
final TextEditingController carNormal = new TextEditingController();
final TextEditingController carBridal = new TextEditingController();

//VideoGraphy
final TextEditingController vwedding = new TextEditingController();
final TextEditingController vindividual = new TextEditingController();
final TextEditingController vcommercial = new TextEditingController();

//HairDressing
final TextEditingController hairBridal = new TextEditingController();
final TextEditingController wigLines = new TextEditingController();
final TextEditingController wigInstallation = new TextEditingController();
final TextEditingController smallBraiding = new TextEditingController();
final TextEditingController mediumBraiding = new TextEditingController();
final TextEditingController largeBraiding = new TextEditingController();
final TextEditingController washAndBlowDraw = new TextEditingController();

////MassagePricing
final TextEditingController deepTissue = new TextEditingController();
final TextEditingController swedish = new TextEditingController();
final TextEditingController prenatal = new TextEditingController();
final TextEditingController backneckshoukder = new TextEditingController();
