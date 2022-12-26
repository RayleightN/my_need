import '../firestore_service.dart';

class TaskApiService {
  static final TaskApiService _singleton = TaskApiService._getInstance();
  factory TaskApiService() {
    return _singleton;
  }
  TaskApiService._getInstance();

  final FireStoreRequest _fireStoreRequest =
      FireStoreRequest(collection: 'Task');

  Future<List<dynamic>> getListTask() async {
    return await _fireStoreRequest.getAllDocuments();
  }
}
