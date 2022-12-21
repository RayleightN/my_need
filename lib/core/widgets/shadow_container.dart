import 'package:flutter/material.dart';
import 'package:my_need/core/constants/size_constant.dart';

class MNShadowContainer extends StatelessWidget {
  const MNShadowContainer(
      {this.child,
      this.shadowOpacity = 0.06,
      this.margin,
      this.padding,
      this.borderRadius = borderRadius8,
      Key? key})
      : super(key: key);
  final Widget? child;
  final double shadowOpacity;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.black.withOpacity(0.06),
          ),
        ],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
