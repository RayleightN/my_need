import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_need/source/core/resources/data_state.dart';

class FireStoreRequest {
  String collection;
  FireStoreRequest({required this.collection});
  CollectionReference get collectionRef =>
      FirebaseFirestore.instance.collection(collection);

  Future<List<dynamic>> getAllDocuments() async {
    var snap = await collectionRef.get();
    return snap.docs.map((e) => e.data() as Map<String, dynamic>).toList();
  }

  Future<DocumentReference<dynamic>> add(
      {required Map<String, dynamic> data}) async {
    return await collectionRef.add(data);
  }

  Future<List<dynamic>> getByQuery({
    required String fieldName,
    required String key,
  }) async {
    var snap = await collectionRef.where(fieldName, isEqualTo: key).get();
    return snap.docs.map((e) => e.data() as Map<String, dynamic>).toList();
  }

  Future<Map<String, dynamic>> getById(String id) async {
    var document = await collectionRef.doc(id).get();
    return document as Map<String, dynamic>;
  }

  Future<DataState<UserCredential>> signIn(
      {String? email, String? password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );
      return DataSuccess(credential);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    }
  }
}
