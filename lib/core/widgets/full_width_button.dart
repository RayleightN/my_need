import 'package:flutter/material.dart';
import 'package:my_need/core/constants/size_constant.dart';
import 'package:my_need/utils/colors.dart';
import 'package:my_need/utils/font_scale.dart';

class MNFullWidthButton extends StatelessWidget {
  const MNFullWidthButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isPadding = true,
    this.height = 44,
    this.isSemiBold12 = false,
    this.isEnabled = true,
    this.color = mainBlueColor,
    this.textColor = Colors.white,
    this.borderColor,
    this.borderRadius = borderRadius8,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final bool isEnabled;
  final bool isPadding;
  final bool isSemiBold12;
  final double height;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled) {
          onPressed();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: isPadding ? margin16 : 0),
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          color: isEnabled ? color : btnDisabledColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Center(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ).semiBold14(color: textColor),
        ),
      ),
    );
  }
}
