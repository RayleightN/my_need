import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_need/core/app_repository.dart';
import 'package:my_need/source/domain/usecases/login_usecase.dart';
import 'package:my_need/source/domain/entities/user.dart';
import 'package:my_need/source/domain/repositories/auth_repository.dart';
import 'package:my_need/source/injector.dart';
import 'package:my_need/source/presentation/login/login_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var appRepo = injector<AppRepository>();
  final LoginUsecase _loginUseCase = injector<LoginUsecase>();

  void updateText(LoginArgs loginArgs) {
    emit(LoginInitial());
    emailController.text = loginArgs.email ?? "";
    passwordController.text = loginArgs.password ?? "";
    emit(LoginLoaded());
  }

  void signIn({required Function onSuccess}) async {
    var result = await _loginUseCase.call(
        params: LoginParam(
      email: emailController.text,
      password: passwordController.text,
    ));
    if (result.data != null) updateUserInformation(result.data);
  }

  void updateUserInformation(UserInformation? user) {
    /// TODO: call fire store to update user infor
    if (user != null) {
      appRepo.user = user;
    }
  }
}
