import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestore_service.dart';

class TaskApiService {
  static final TaskApiService _singleton = TaskApiService._getInstance();
  factory TaskApiService() {
    return _singleton;
  }
  TaskApiService._getInstance();

  final FireStoreRequest _fireStoreRequest =
      FireStoreRequest(collection: 'Task');

  Future<QuerySnapshot<dynamic>> getListTask() async {
    return await _fireStoreRequest.collectionRef.get();
  }
}
