import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

String aboutUs;
String contactUs;

UserDetails userDetails;
List<UserDetails> listUserDetail = [];
List<UserDetails> supportersList = [];

///User
class UserDetails {
  final String userEmail;
  // final GeoFirePoint location;
  final String userUid;
  final double longitude;
  final double latitude;
  final String userpic;
  final String idCardPic;
  final String certificatePic;
  final String kraPincode;
  final String firstname;
  final String lastname;
  bool notificationOpened;
  bool approved;
  final String descripton;
  final String userDocid;
  final String gender;
  final String service;
  final String number;

  UserDetails({
    @required this.userEmail,
    @required this.userDocid,
    @required this.latitude,
    @required this.longitude,
    @required this.userUid,
    @required this.approved,
    @required this.notificationOpened,
    @required this.lastname,
    @required this.descripton,
    @required this.number,
    @required this.kraPincode,
    @required this.certificatePic,
    // @required this.location,
    @required this.idCardPic,
    @required this.firstname,
    @required this.userpic,
    @required this.gender,
    @required this.service,
  });
}

///////Pricing Model///

//MakeUP
MakeupPricig artwork;

List<MakeupPricig> listArtWorkDetail = [];

class MakeupPricig {
  final String bridalMakeUp;
  final String bridesmaidMakeUp;
  final String makeupLashes;
  final String makeup;

  MakeupPricig({
    @required this.bridalMakeUp,
    @required this.makeup,
    @required this.bridesmaidMakeUp,
    @required this.makeupLashes,
  });
}

//Heena
Heena heena;

List<Heena> heenaDetail = [];

class Heena {
  final String bridal;
  final String hands;
  final String handsAndLegs;

  Heena({
    @required this.bridal,
    @required this.hands,
    @required this.handsAndLegs,
  });
}

//PedicureAndMedicure
PedicureAndMedicure pedicureAndMedicure;

List<PedicureAndMedicure> pedicureAndMedicureDetails = [];

class PedicureAndMedicure {
  final String meniCurePandG;
  final String meniCureP;
  final String pediCurePandG;
  final String pediCureP;

  PedicureAndMedicure({
    @required this.meniCureP,
    @required this.meniCurePandG,
    @required this.pediCureP,
    @required this.pediCurePandG,
  });
}

//Phototgraphy
Phototgraphy phototgraphy;

List<Phototgraphy> phototgraphyDetail = [];

class Phototgraphy {
  final String wedding;
  final String individual;
  final String family;
  final String commercial;

  Phototgraphy({
    @required this.wedding,
    @required this.individual,
    @required this.family,
    @required this.commercial,
  });
}

//TaxiService
TaxiService taxiService;

List<TaxiService> taxiServiceDetail = [];

class TaxiService {
  final String small;
  final String eleven;
  final String carNormal;
  final String carBridal;

  TaxiService({
    @required this.small,
    @required this.eleven,
    @required this.carNormal,
    @required this.carBridal,
  });
}

//VideoGraphy
VideoGraphy videoGraphy;

List<VideoGraphy> videoGraphyDetail = [];

class VideoGraphy {
  final String wedding;
  final String individual;
  final String commercial;

  VideoGraphy({
    @required this.wedding,
    @required this.individual,
    @required this.commercial,
  });
}

//HairDressing
HairDressing hairDressing;

List<HairDressing> hairDressingDetail = [];

class HairDressing {
  final String bridal;
  final String wigLines;
  final String wigInstallation;
  final String smallBraiding;
  final String mediumBraiding;
  final String largeBraiding;
  final String washAndBlowDraw;

  HairDressing({
    @required this.bridal,
    @required this.washAndBlowDraw,
    @required this.wigInstallation,
    @required this.smallBraiding,
    @required this.largeBraiding,
    @required this.mediumBraiding,
    @required this.wigLines,
  });
}

//MassagePricing
MassagePricing massagePricing;

List<MassagePricing> massagePricingDetail = [];

class MassagePricing {
  final String deepTissue;
  final String swedish;
  final String prenatal;
  final String backneckshoukder;

  MassagePricing({
    @required this.deepTissue,
    @required this.swedish,
    @required this.prenatal,
    @required this.backneckshoukder,
  });
}

////Customer Detail
CustomerDetail customerDetail;

List<CustomerDetail> customerDetailList = [];

class CustomerDetail {
  final String userEmail;
  // final GeoFirePoint location;
  final String userUid;
  final double longitude;
  final double latitude;
  final String firstname;
  final String lastname;
  final String userDocid;
  final String number;

  CustomerDetail({
    @required this.userEmail,
    @required this.userDocid,
    @required this.latitude,
    @required this.longitude,
    @required this.userUid,
    @required this.lastname,
    @required this.number,
    @required this.firstname,
  });
}
