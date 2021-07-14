import 'package:flutter/material.dart';
import 'package:sellerapp/Models/models.dart';
import 'package:sellerapp/customerrequest.dart';
import 'package:sellerapp/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String userUid;
String serviceType;
String serviceDocid;
String noOfCustomer;

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: textcolor,
        elevation: 0.0,
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("ServiceRequest")
              .where("accepted", isEqualTo: false)
              .where("rejected", isEqualTo: false)
              .where("sellerUid", isEqualTo: userDetails.userUid)

              // .where("sellerUid", isEqualTo: userDetails.userUid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // return Center(
              //   child: Text(
              //     'NO SELLERS YET',
              //   ),
              // );
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot serviceDetail =
                        snapshot.data.documents[index];

                    return InkWell(
                      onTap: () {
                        userUid = serviceDetail["userUid"];
                        serviceType = serviceDetail["serviceType"] +
                            " " +
                            serviceDetail["ServicePrice"];
//  serviceDocid=snapshot.data.d
                        noOfCustomer = serviceDetail["NumberOfPerson"];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerRequest()));
                      },
                      child: Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            color: Colors.pink[50],
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(color: Colors.red, width: 1)),
                        child: ListTile(
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        new AssetImage("assets/female.png"))),
                          ),
                          subtitle: Text("Date of service : " +
                              DateFormat('EEE, M/d/y').format(
                                  DateTime.parse(serviceDetail["DateTime"]))),
                          trailing: IconButton(
                              icon: Icon(Icons.chevron_right),
                              onPressed: () {}),
                          title: Text(
                            serviceDetail["userName"] +
                                " sent you a service request",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ),
                    );
                    // return Container(
                    //   margin: EdgeInsets.all(6.0),
                    //   decoration: BoxDecoration(
                    //       color: Colors.pink[50],
                    //       borderRadius: BorderRadius.circular(50.0),
                    //       border: Border.all(color: Colors.red, width: 1)),
                    //   child: ListTile(
                    //     subtitle: Text("Date of service : " +
                    //         DateFormat('EEE, M/d/y').format(
                    //             DateTime.parse(serviceDetail["DateTime"]))),
                    //     trailing: Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       decoration: new BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           image: new DecorationImage(
                    //               fit: BoxFit.fill,
                    //               image: serviceDetail["serviceType"] ==
                    //                       "Makeup"
                    //                   ? new AssetImage("assets/one.jpg")
                    //                   : serviceDetail["serviceType"] ==
                    //                           "Hair Dressing"
                    //                       ? new AssetImage("assets/two.jpg")
                    //                       : serviceDetail["serviceType"] ==
                    //                               "Massage service"
                    //                           ? new AssetImage(
                    //                               "assets/three.jpg")
                    //                           : serviceDetail["serviceType"] ==
                    //                                   "Heena"
                    //                               ? new AssetImage(
                    //                                   "assets/four.jpg")
                    //                               : serviceDetail[
                    //                                           "serviceType"] ==
                    //                                       "Pedicure & Manicure"
                    //                                   ? new AssetImage(
                    //                                       "assets/five.jpg")
                    //                                   : serviceDetail[
                    //                                               "serviceType"] ==
                    //                                           "Photography"
                    //                                       ? new AssetImage(
                    //                                           "assets/six.jpg")
                    //                                       : serviceDetail[
                    //                                                   "serviceType"] ==
                    //                                               "Taxi Services"
                    //                                           ? new AssetImage(
                    //                                               "assets/seven.jpg")
                    //                                           : new AssetImage(
                    //                                               "assets/eight.jpg"))),
                    //     ),
                    //     leading: Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       decoration: new BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           image: new DecorationImage(
                    //               fit: BoxFit.fill,
                    //               image: new NetworkImage(
                    //                   serviceDetail["sellerPic"]))),
                    //     ),
                    //     title: Text(
                    //       serviceDetail["sellerName"] +
                    //           " accepted your service request",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 15),
                    //     ),
                    //   ),
                    // );
                  });
            }
          }),
      // body: ListView.builder(
      //     itemCount: 5,
      //     itemBuilder: (context, index) => InkWell(
      //           onTap: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => CustomerRequest()));
      //           },
      //           child: Container(
      //             margin: EdgeInsets.all(6.0),
      //             decoration: BoxDecoration(
      //                 color: Colors.pink[50],
      //                 borderRadius: BorderRadius.circular(50.0),
      //                 border: Border.all(color: Colors.red, width: 1)),
      //             child: ListTile(
      //               leading: Container(
      //                 width: 50.0,
      //                 height: 50.0,
      //                 decoration: new BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     image: new DecorationImage(
      //                         fit: BoxFit.fill,
      //                         image: new AssetImage("assets/female.png"))),
      //               ),
      //               subtitle: Text("2days ago"),
      //               trailing: IconButton(
      //                   icon: Icon(Icons.chevron_right), onPressed: () {}),
      //               title: Text(
      //                 "Sentoria sent your service request",
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold, fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ))
    );
  }
}
