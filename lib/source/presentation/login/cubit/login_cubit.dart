import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_need/core/app_repository.dart';
import 'package:my_need/source/domain/entities/user.dart';
import 'package:my_need/source/injector.dart';
import 'package:my_need/source/presentation/login/login_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var appRepo = injector<AppRepository>();

  void updateText(LoginArgs loginArgs) {
    emit(LoginInitial());
    emailController.text = loginArgs.email ?? "";
    passwordController.text = loginArgs.password ?? "";
    emit(LoginLoaded());
  }

  void signIn({required Function onSuccess}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      onSuccess.call();
      updateUserInformation(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void updateUserInformation(UserCredential credential) {
    /// TODO: call fire store to update user infor
    appRepo.user = UserInformation(
      email: credential.user?.email,
      id: credential.user?.uid,
      phone: credential.user?.phoneNumber,
    );
  }
}
