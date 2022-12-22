import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreRequest {
  String collection;
  FireStoreRequest({required this.collection});
  CollectionReference get collectionRef =>
      FirebaseFirestore.instance.collection(collection);

  Future<QuerySnapshot<dynamic>> get() async {
    return await collectionRef.get();
  }

  Future<DocumentReference<dynamic>> add(
      {required Map<String, dynamic> data}) async {
    return await collectionRef.add(data);
  }
}
