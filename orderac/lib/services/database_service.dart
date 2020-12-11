import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  Future updateUserDetails(name) async {
    return await collectionReference.doc(uid).set({
      'Name': name,
    });
  }

  Stream<QuerySnapshot> get items {
    return collectionReference.snapshots();
  }
}
