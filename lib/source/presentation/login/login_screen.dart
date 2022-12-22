import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_need/core/app_router/navigation_service.dart';
import 'package:my_need/core/app_router/routes.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/core/image_path.dart';
import 'package:my_need/core/widgets/full_width_button.dart';
import 'package:my_need/core/widgets/shadow_container.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/source/presentation/login/cubit/login_cubit.dart';
import 'package:my_need/utils/colors.dart';

import '../../../core/component_style.dart';

class LoginArgs {
  String? email;
  String? password;

  LoginArgs({this.email, this.password});
}

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
    this.loginArgs,
  }) : super(key: key);
  final LoginArgs? loginArgs;
  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: mainBgColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: darkStatusBar,
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              return Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: padding16),
                  children: [
                    _buildLogo(context),
                    heightBox48,
                    _buildEmail(),
                    heightBox8,
                    _buildPassword(),
                    heightBox24,
                    _buildLoginButton(context),
                    heightBox24,
                    Container(
                        alignment: Alignment.center,
                        child: _buildForgotLabel()),
                    heightBox8,
                    Container(
                        alignment: Alignment.center,
                        child: _buildSignUpLabel()),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset(ImagePath.loginLogo),
      ),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: cubit.emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
        hintText: 'Email',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius32)),
      ),
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: cubit.passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: padding12),
        hintText: 'Password',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius32)),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return MNShadowContainer(
      borderRadius: borderRadius32,
      child: MNFullWidthButton(
        title: 'Log In',
        onPressed: () {
          cubit.signIn(onSuccess: () {
            NavigationService.push(Routes.listTask);
          });
        },
        isPadding: false,
        borderRadius: borderRadius32,
        color: loginButtonColor,
      ),
    );
  }

  Widget _buildForgotLabel() {
    return InkWell(
      child: const Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onTap: () {},
    );
  }

  Widget _buildSignUpLabel() {
    return InkWell(
      child: const Text(
        "You don't have an account, create one?",
        style: TextStyle(color: Colors.black54),
      ),
      onTap: () {
        NavigationService.push(Routes.signUp).then((value) {
          if (value is LoginArgs) {
            cubit.updateText(value);
          }
        });
      },
    );
  }
}
