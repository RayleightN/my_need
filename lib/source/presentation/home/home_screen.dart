import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_need/core/component_style.dart';
import 'package:my_need/core/widgets/decorations.dart';
import 'package:my_need/source/presentation/home/home_bottom_bar.dart';
import 'package:my_need/utils/font_scale.dart';
import '../../../core/app_router/navigation_service.dart';
import '../../../core/constants/size_constant.dart';
import '../../../core/widgets/sized_box.dart';
import '../../../utils/colors.dart';
import 'home_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listComponent = [
      HomeComponent(),
      HomeComponent(),
      HomeComponent(),
      HomeComponent(),
    ];
    return Scaffold(
      bottomNavigationBar: HomeBottomNavigationBar(
        onItemTapped: (index) {},
        selectedIndex: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: darkStatusBar,
        child: SafeArea(
          top: false,
          bottom: false,
          child: Container(
            color: mainBgColor,
            child: Column(
              children: [
                Container(
                  height: 60 + kToolbarHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      boxShadow01,
                    ],
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: margin16),
                    child: Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                              ),
                              widthBox12,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('nam le')
                                          .semiBold14(color: bodyTextColor),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 18,
                                        color: bodyTextColor,
                                      ),
                                    ],
                                  ),
                                  Text('napoleon1704@gmail.com')
                                      .regularContext12(
                                          color: subTitleTextColor),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.blue,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // heightBox12,
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          controller: ScrollController(),
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 7,
                          children: listComponent,
                        ),
                        // Text('Something'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
