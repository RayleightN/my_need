import 'package:flutter/material.dart';
import 'package:my_need/core/app_router/navigation_service.dart';
import 'package:my_need/core/app_router/routes.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/core/image_path.dart';
import 'package:my_need/core/widgets/full_width_button.dart';
import 'package:my_need/core/widgets/shadow_container.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/utils/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: Center(
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
            _buildForgotLabel(),
          ],
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
          NavigationService.push(Routes.listTask);
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
}
