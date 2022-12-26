import 'package:my_need/source/core/resources/data_state.dart';
import 'package:my_need/source/core/usecases/usecase.dart';
import 'package:my_need/source/domain/entities/user.dart';
import 'package:my_need/source/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<DataState<UserInformation>, LoginParam> {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  @override
  Future<DataState<UserInformation>> call({params}) {
    return _authRepository.login(params);
  }
}
