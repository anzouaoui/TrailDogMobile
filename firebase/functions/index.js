const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions
  .region("europe-west1")
  .auth.user()
  .onDelete(async (user) => {
    let firestore = admin.firestore();
    let userRef = firestore.doc("users/" + user.uid);
    await firestore
      .collection("chat")
      .where("users", "array-contains", userRef)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          await doc.ref
            .collection("messages")
            .get()
            .then(async (q) => {
              for (var d of q.docs) {
                console.log(
                  `Deleting document ${d.id} from collection messages`,
                );
                await d.ref.delete();
              }
            });
        }
      });
    await firestore.collection("users").doc(user.uid).delete();
    await firestore
      .collection("friendsRequests")
      .where("user_from", "==", userRef)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(
            `Deleting document ${doc.id} from collection friendsRequests`,
          );
          await doc.ref.delete();
        }
      });
    await firestore
      .collection("chat")
      .where("users", "array-contains", userRef)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(`Deleting document ${doc.id} from collection chat`);
          await doc.ref.delete();
        }
      });
    await firestore
      .collection("posts")
      .where("user_ref", "==", userRef)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(`Deleting document ${doc.id} from collection posts`);
          await doc.ref.delete();
        }
      });
    await firestore
      .collection("comments")
      .where("user_ref", "==", userRef)
      .get()
      .then(async (querySnapshot) => {
        for (var doc of querySnapshot.docs) {
          console.log(`Deleting document ${doc.id} from collection comments`);
          await doc.ref.delete();
        }
      });
  });
