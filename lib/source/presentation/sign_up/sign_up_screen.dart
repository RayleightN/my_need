import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_need/core/app_router/navigation_service.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/core/image_path.dart';
import 'package:my_need/core/widgets/full_width_button.dart';
import 'package:my_need/core/widgets/mother_page.dart';
import 'package:my_need/core/widgets/shadow_container.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/source/presentation/login/login_screen.dart';
import 'package:my_need/source/presentation/sign_up/cubit/sign_up_cubit.dart';
import 'package:my_need/utils/colors.dart';

import '../../../core/component_style.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpCubit cubit = SignUpCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: MNMotherPage(
        child: Scaffold(
          backgroundColor: mainBgColor,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: darkStatusBar,
            child: Center(
              child: BlocBuilder<SignUpCubit, SignUpState>(
                builder: (context, state) {
                  return ListView(
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
                    ],
                  );
                },
              ),
            ),
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
      controller: cubit.passWordController,
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
        title: 'Sign Up',
        onPressed: () {
          cubit.signUp(onSuccess: () {
            NavigationService.pop(
                data: LoginArgs(
              email: cubit.emailController.text,
              password: cubit.passWordController.text,
            ));
          });
        },
        isPadding: false,
        borderRadius: borderRadius32,
        color: loginButtonColor,
      ),
    );
  }
}
