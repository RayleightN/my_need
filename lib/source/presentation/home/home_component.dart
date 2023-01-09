import 'package:flutter/material.dart';
import 'package:my_need/core/widgets/sized_box.dart';
import 'package:my_need/utils/font_scale.dart';

import '../../../core/widgets/decorations.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({
    this.title,
    this.bgColor,
    this.icon,
    Key? key,
  }) : super(key: key);
  final Color? bgColor;
  final Icon? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 24,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.task,
                  color: Colors.white,
                  size: 30,
                ),
                heightBox8,
                Text('Todos').regular18(color: Colors.white),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('100').regular20(color: Colors.white),
                Text('todos expired').regularContext12(color: Colors.white),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  boxShadow015,
                ],
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.amberAccent,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
