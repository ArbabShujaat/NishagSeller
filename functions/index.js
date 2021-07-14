const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp();
const db = admin.firestore();
const fcm = admin.messaging();

exports.notifyNewMessageSeller = functions.firestore
    .document('ServiceRequest/{sellerDocid}')

    .onCreate(async snapshot => {
        const message = snapshot.data();
       
       

       
        const querySnapshot = await db
            .collection('Sellers')
            .doc(message.sellerDocid)
            .collection('tokens')   
            .get();

        const tokens = querySnapshot.docs.map(snap => snap.id);

        const payload = {
            notification: {
                title: `Nisah App`,
                body: "Your recieve a service request",
                clickAction: 'FLUTTER_NOTIFICATION_CLICK',
            }
        }
        return fcm.sendToDevice(tokens, payload);
   

    });

