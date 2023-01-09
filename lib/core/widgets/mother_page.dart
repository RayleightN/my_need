import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/core/widgets/decorations.dart';
import 'package:my_need/utils/colors.dart';
import 'package:my_need/utils/font_scale.dart';

import '../app_router/navigation_service.dart';
import '../component_style.dart';

class MNMotherPage extends StatelessWidget {
  const MNMotherPage({Key? key, this.screenTitle = '', required this.child})
      : super(key: key);

  final String screenTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: lightStatusBar,
        child: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            color: mainBgColor,
            child: Column(
              children: [
                Container(
                  height: 30 + kToolbarHeight,
                  decoration: BoxDecoration(
                    color: mainBlueColor,
                    boxShadow: [
                      boxShadow01,
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: margin16),
                    child: Container(
                      margin: const EdgeInsets.only(top: margin24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: platformIconBack(Colors.white),
                            onTap: () {
                              NavigationService.pop();
                            },
                          ),
                          Expanded(
                            child: Center(
                              child:
                                  Text(screenTitle, textAlign: TextAlign.center)
                                      .semiBold16(color: Colors.white),
                            ),
                          ),
                          InkWell(
                            child: platformIconBack(Colors.transparent),
                            onTap: () {
                              NavigationService.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
