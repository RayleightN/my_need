import 'package:my_need/source/domain/entities/user.dart';

import '../../core/resources/data_state.dart';

abstract class AuthRepository {
  Future<DataState<UserInformation>> login(LoginParam? param);
}

class LoginParam {
  String email;
  String password;
  LoginParam({required this.email, required this.password});
}
