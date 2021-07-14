import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellerapp/Models/models.dart';
import 'package:sellerapp/Pendingorderclick.dart';
import 'package:sellerapp/help.dart';
import 'package:sellerapp/notifications.dart';
import 'package:sellerapp/register.dart';
import 'package:sellerapp/sellerprofile.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  Future<bool> _onBackButton() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Confirm Exit"),
              content: Text("Are you sure you want to exit?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("No")),
                FlatButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text("Yes"))
              ],
            ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (WillPopScope(
      onWillPop: _onBackButton,
      child: Container(
        child: userDetails.approved == false
            ? Scaffold(
                appBar: AppBar(
                  backgroundColor: textcolor,
                  elevation: 0.0,
                ),
                body: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "NOTE",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Thank you for choosing Nisah Services.\nAfter reviewing your provided info,We will let you know about approval using email or contact number \n(with in 24 hours)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: textcolor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Scaffold(
                bottomNavigationBar: _buildBottomNavigationBar(),
                appBar: AppBar(
                  title: Text("Booking Details"),
                  backgroundColor: textcolor,
                ),
                body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(
                          "Pending Orders",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, color: Colors.white70),
                          height: MediaQuery.of(context).size.height * .41,
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: StreamBuilder(
                              stream: Firestore.instance
                                  .collection("ServiceRequest")
                                  .where("sellerUid",
                                      isEqualTo: userDetails.userUid)
                                  .where("accepted", isEqualTo: true)
                                  .where("rejected", isEqualTo: false)
                                  .where("completed", isEqualTo: false)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  // return Center(
                                  //   child: Text(
                                  //     'NO SELLERS YET',
                                  //   ),
                                  // );
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: Colors.red,
                                        thickness: 0.5,
                                      );
                                    },
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot bookingDetail =
                                          snapshot.data.documents[index];
                                      return pendingorders(bookingDetail);
                                    },
                                  );
                                }
                              }),
                        ),
                        Text(
                          "Completed Orders",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, color: Colors.white70),
                          height: MediaQuery.of(context).size.height * .51,
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                          child: StreamBuilder(
                              stream: Firestore.instance
                                  .collection("ServiceRequest")
                                  .where("sellerUid",
                                      isEqualTo: userDetails.userUid)
                                  .where("accepted", isEqualTo: true)
                                  .where("rejected", isEqualTo: false)
                                  .where("completed", isEqualTo: true)
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  // return Center(
                                  //   child: Text(
                                  //     'NO SELLERS YET',
                                  //   ),
                                  // );
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else {
                                  return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: Colors.red,
                                        thickness: 0.5,
                                      );
                                    },
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot bookingDetail =
                                          snapshot.data.documents[index];
                                      return completedorders(bookingDetail);
                                    },
                                  );
                                }
                              }),
                        ),
                      ],
                    ))),
      ),
    ));
  }

  Widget pendingorders(DocumentSnapshot bookingDetail) {
    return InkWell(
      onTap: () {
        userUid = bookingDetail["userUid"];
        serviceType =
            bookingDetail["serviceType"] + " " + bookingDetail["ServicePrice"];
//  serviceDocid=snapshot.data.d
        noOfCustomer = bookingDetail["NumberOfPerson"];
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PendingOrdersclick()));
      },
      child: Container(
          decoration: BoxDecoration(
              color: textcolor, borderRadius: BorderRadius.circular(5.0)),
          width: 400,
          height: 100,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(7.0),
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/female.png",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: AutoSizeText(
                      bookingDetail["userName"],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Date:-",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          DateFormat('EEE, M/d/y').format(
                              DateTime.parse(bookingDetail["DateTime"])),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "Time:",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 17,
                  //         ),
                  //       ),
                  //       Text(
                  //         "1 hour",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Cost : ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        bookingDetail["ServicePrice"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Customers:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        bookingDetail["NumberOfPerson"],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ])),
    );
  }

  Widget completedorders(DocumentSnapshot bookingDetail) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(5.0)),
        width: 400,
        height: 100,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7.0),
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/female.png",
                          ),
                          fit: BoxFit.cover)),
                ),
                Text(
                  bookingDetail["userName"],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Date:-",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        DateFormat('EEE, M/d/y')
                            .format(DateTime.parse(bookingDetail["DateTime"])),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Text(
                //         "Time:",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 17,
                //         ),
                //       ),
                //       Text(
                //         "1 hour",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 15,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Cost : ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      bookingDetail["ServicePrice"],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Customers:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      bookingDetail["NumberOfPerson"],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]));
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: textcolor),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white, unselectedItemColor: Colors.white,

//      backgroundColor: Theme.of(context).primaryColor,
//      fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,

        elevation: 0,
        iconSize: 30,
        unselectedLabelStyle: TextStyle(),

        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home', style: TextStyle())),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Firestore.instance
                      .collection("Sellers")
                      .document(userDetails.userDocid)
                      .update({"notificationOpened": true});

                  setState(() {
                    userDetails.notificationOpened = true;
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: userDetails.notificationOpened
                    ? Icon(Icons.notification_important)
                    : new Stack(
                        children: <Widget>[
                          new Icon(Icons.notifications),
                          new Positioned(
                            right: 0,
                            child: new Container(
                              padding: EdgeInsets.all(1),
                              decoration: new BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 14,
                                minHeight: 14,
                              ),
                              child: new Text(
                                '1',
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
              ),
              title: Text('Notifications', style: TextStyle(fontSize: 12))),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Icon(Icons.person)),
              title: Text('Account', style: TextStyle())),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpScreen()));
                  },
                  child: Icon(Icons.help)),
              title: Text('Help', style: TextStyle())),
        ],
      ),
    );
  }
}
