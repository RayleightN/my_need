import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/domain/entities/user.dart';

import '../firestore_service.dart';

class AuthApiService {
  static final AuthApiService _singleton = AuthApiService._getInstance();
  factory AuthApiService() {
    return _singleton;
  }
  AuthApiService._getInstance();

  final FireStoreRequest _fireStoreRequest =
      FireStoreRequest(collection: 'Task');

  Future<QuerySnapshot<dynamic>> getListTask() async {
    return await _fireStoreRequest.collectionRef.get();
  }

  Future<DataState<UserInformation>> signIn(
      {String? email, String? password}) async {
    var result =
        await _fireStoreRequest.signIn(email: email, password: password);
    if (result.data != null) {
      UserInformation user = UserInformation(
          id: result.data?.user?.uid,
          email: result.data?.user?.email,
          phone: result.data?.user?.phoneNumber,
          displayName: result.data?.user?.displayName);
      return DataSuccess(user);
    }
    return DataFailed(result.error);
  }
}
