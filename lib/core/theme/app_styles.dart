import 'package:flutter/material.dart';

abstract class AppStyles {
  /// Base Style بدون ألوان — بس Font + Responsive
  static TextStyle base(BuildContext context, double fontSize) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontFamily: 'Poppins',
    );
  }

  /// Styles جاهزة بدون ألوان
  static TextStyle regular16(BuildContext context) =>
      base(context, 16).copyWith(fontWeight: FontWeight.w400);

  static TextStyle medium16(BuildContext context) =>
      base(context, 16).copyWith(fontWeight: FontWeight.w500);

  static TextStyle semiBold16(BuildContext context) =>
      base(context, 16).copyWith(fontWeight: FontWeight.w600);

  static TextStyle bold16(BuildContext context) =>
      base(context, 16).copyWith(fontWeight: FontWeight.w700);

  static TextStyle regular14(BuildContext context) =>
      base(context, 14).copyWith(fontWeight: FontWeight.w400);

  static TextStyle regular12(BuildContext context) =>
      base(context, 12).copyWith(fontWeight: FontWeight.w400);

  static TextStyle semiBold18(BuildContext context) =>
      base(context, 18).copyWith(fontWeight: FontWeight.w600);

  static TextStyle semiBold20(BuildContext context) =>
      base(context, 20).copyWith(fontWeight: FontWeight.w600);

  static TextStyle semiBold24(BuildContext context) =>
      base(context, 24).copyWith(fontWeight: FontWeight.w600);
}

/// ----- Responsive Font System -----

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < SizeConfig.tablet) {
    return width / 550; // phone
  } else if (width < SizeConfig.desktop) {
    return width / 1000; // tablet
  } else {
    return width / 1920; // desktop
  }
}

class SizeConfig {
  static const double desktop = 1200;
  static const double tablet = 800;

  static late double width, height;

  static init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
