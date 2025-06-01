import 'package:flutter/material.dart';

import '../colors/color.dart';


class AppTextStyles {
  static const String _fontFamily = "Inter";

  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color color = AppColor.greyScale900,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: _fontFamily,
      color: color,
    );
  }

  // Headings
  static TextStyle heading1({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 64, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading2({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 48, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading3({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 32, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading4({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 24, fontWeight: FontWeight.w700, color: color);

  static TextStyle heading5({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 20, fontWeight: FontWeight.w700, color: color);


  // Bold
  static TextStyle XLargeBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color);

  static TextStyle LargeBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color);

  static TextStyle MediumBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color);

  static TextStyle SmallBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color);

  static TextStyle XSmallBold({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w400, color: color);

  // Medium

  static TextStyle XLMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 18, fontWeight: FontWeight.w600, color: color);

  static TextStyle LargeMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);

  static TextStyle MediumMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);

  static TextStyle SmallMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color);

  static TextStyle XSmallMedium({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w600, color: color);

  // Regular
  static TextStyle XLRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color);

  static TextStyle LargeRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color);

  static TextStyle Mediumregular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color);

  static TextStyle SmallRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color);

  static TextStyle XSmallRegular({Color color = AppColor.greyScale900}) =>
      _textStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color);


}
