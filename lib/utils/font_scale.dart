import 'package:flutter/material.dart';
import 'colors.dart';

class RatioScreenApp {
  static double? _ratio;
  static final RatioScreenApp _singleton = RatioScreenApp._instance();

  /// Phải gọi trong hàm build khi khởi tạo tỷ lệ
  ///
  /// Nếu không gọi thì sẽ mặc định tỷ lệ là 1.0
  factory RatioScreenApp.setRatio(double? ratio) {
    _ratio ??= ratio ?? 1;
    return _singleton;
  }

  RatioScreenApp._instance();
  static double getRatio() => _ratio ?? 1.0;
}

extension FontScale on Text {
  static double myRatio = RatioScreenApp.getRatio();

  Text semiBold12({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 12 * myRatio,
        height: 1.3333,
        fontWeight: FontWeight.w600,
        color: color ?? titleTextColor,
      ));
  Text regularContext12({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 12 * myRatio,
        height: 1.3333,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text regularDisplay12({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 12 * myRatio,
        height: 1.6667,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text semiBold14({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 14 * myRatio,
        height: 1.4286,
        fontWeight: FontWeight.w600,
        color: color ?? titleTextColor,
      ));

  Text regularContext14({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 14 * myRatio,
        height: 1.4286,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text regularDisplay14({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 14 * myRatio,
        height: 1.7143,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text semiBold20({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 20 * myRatio,
        height: 1.6,
        fontWeight: FontWeight.w600,
        color: color ?? titleTextColor,
      ));

  Text regular20({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 20 * myRatio,
        height: 1.6,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text semiBold18({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 18 * myRatio,
        fontWeight: FontWeight.w600,
        height: 1.5556,
        color: color ?? titleTextColor,
      ));

  Text regular18({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 18 * myRatio,
        fontWeight: FontWeight.w400,
        height: 1.5556,
        color: color ?? titleTextColor,
      ));

  Text semiBold16({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 16 * myRatio,
        height: 1.5,
        fontWeight: FontWeight.w600,
        color: color ?? titleTextColor,
      ));

  Text regular16({Color? color}) => _copyWith(
          style: TextStyle(
        fontSize: 16 * myRatio,
        height: 1.5,
        fontWeight: FontWeight.w400,
        color: color ?? titleTextColor,
      ));

  Text _copyWith(
      {Key? key,
      StrutStyle? strutStyle,
      TextAlign? textAlign,
      TextDirection textDirection = TextDirection.ltr,
      Locale? locale,
      bool? softWrap,
      TextOverflow? overflow,
      double? textScaleFactor,
      int? maxLines,
      String? semanticsLabel,
      TextWidthBasis? textWidthBasis,
      TextStyle? style}) {
    return Text(data!,
        key: key ?? this.key,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        style: style != null ? this.style?.merge(style) ?? style : this.style);
  }
}
