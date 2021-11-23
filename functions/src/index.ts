import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const fcm = admin.messaging();

export const notifyNewGroup=functions.firestore
.document("groups/{groupsId}")
.onCreate(async snapshot=>{
    console.log(`New Group Notification with group id = ${snapshot.data().id}`);
    const payload:admin.messaging.MessagingPayload={
        notification: {
            title: "A new groups has been created",
            body: "Come check it out",
            click_action: "FLUTTER_NOTIFICATION_CLICK",
            sound: "default",
        },
    };
    return fcm.sendToTopic("groups", payload);
});