const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();
var userService="empty";
exports.requestCG= functions.firestore.document(
    "/handicappedUsers/{id}"
).onUpdate(async (snap, context) => {
    const userID = context.params.id;
    console.log(userID);
    const userData = admin.firestore().collection("handicappedUsers"
    ).doc(userID);
    var userLong=0;
    var userLat=0;
    userData.get().then((doc) => {
        if (doc.exists) {
        const onRequest = doc.data()["onRequest"];
        if (onRequest) {
           userLong = doc.data()["longitude"];
            userLat = doc.data()["latitude"];
            userService = doc.data()["typeOfService"];
           console.log("here2");
           console.log(userService);
           const cgData = admin.firestore().collection("caregivers");
           console.log("here");
           console.log(userService);
        cgData.where("longitude", "<", userLong+0.01).where(
            "longitude", ">", userLong - 0.01).where(
                "typeOfSer", "array-contains", userService
            ).get().then(
            function(querySnapshot) {
            if (querySnapshot.size > 0) {
                const latitude = querySnapshot.docs[0].data()["latitude"];
                if ((latitude>(userLat-0.01))&(latitude<(userLat+0.01))) {
                    console.log("here4");
                const ID = querySnapshot.docs[0].data()["ID"];
                const name = querySnapshot.docs[0].data()["name"];
                const rating = querySnapshot.docs[0].data()["userR"];
                return userData.update(
                {userR: rating, cgName: name, cgID: ID, cgPrevRating: rating});
                } else {
return null;
}
            } else {
                console.log("No such document");
                return null;
            }
        }).catch((error) => {
            console.log("Error getting document:", error);
        });
            } else {
return null;
}
        } else {
            console.log("No such document!");
            return null;
        }
    }).catch((error) => {
        console.log("Error getting document:", error);
    });
    console.log("here3");
    console.log(userService);
});
exports.userRating = functions.firestore.document(
    "/handicappedUsers/{id}"
).onUpdate(async (snap, context) => {
    const userID = context.params.id;
    console.log(userID);
    const userData = admin.firestore().collection("handicappedUsers"
    ).doc(userID);
    userData.get().then((doc) => {
        if (doc.exists) {
            const submitRating = doc.data()["submitRating"];
            if (submitRating) {
            console.log("Document data:", doc.data());
            console.log(doc.data()["cgRating"]);
            let rating = doc.data()["cgRating"];
            let numofreq = doc.data()["cgNumOfReq"];
            const caregiverID = doc.data()["cgID"];
            numofreq = numofreq + 1;
            rating = (rating + 4.7) / numofreq;
            console.log(rating);
            return admin.firestore().collection("caregivers"
            ).doc(caregiverID).update({userR: rating});
            }
        } else {
            console.log("No such document!");
            return null;
        }
    }).catch((error) => {
        console.log("Error getting document:", error);
    });
});