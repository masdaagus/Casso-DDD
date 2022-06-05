import 'package:cloud_firestore/cloud_firestore.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String docId) async {
    return FirebaseFirestore.instance.collection('users').doc(docId).get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getResto(
      String restoId) async {
    return FirebaseFirestore.instance.collection('restos').doc(restoId).get();
  }

  Future<void> updateUser(String userID, Map<String, dynamic> data) async {
    FirebaseFirestore.instance.collection('users').doc(userID).update(data);
  }

  Future<bool> setUser(String docId, Map<String, dynamic> data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(docId)
        .set(data)
        .then((val) => true);
  }

  Future<bool> setresto(String restoId, Map<String, dynamic> data) async {
    return FirebaseFirestore.instance
        .collection('restos')
        .doc(restoId)
        .set(data)
        .then((val) => true);
  }
}
