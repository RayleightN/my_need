import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/data/data_sources/auth_api_service.dart';
import 'package:my_need/source/domain/entities/user.dart';
import 'package:my_need/source/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService = AuthApiService();

  @override
  Future<DataState<UserInformation>> login(LoginParam? param) {
    return _authApiService.signIn(
        password: param?.password, email: param?.email);
  }
}
