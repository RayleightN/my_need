import 'package:my_need/source/domain/entities/user.dart';

class AppRepository {
  // static final AppRepository _singleton = AppRepository._getInstance();
  // factory AppRepository() {
  //   return _singleton;
  // }
  // AppRepository._getInstance();

  UserInformation _user = const UserInformation();

  UserInformation get user => _user;

  set user(UserInformation value) {
    _user = value;
  }
}
