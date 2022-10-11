
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';

headingTextStyle(
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.042 : Get.width * 0.051,
      color: color,
      fontWeight: fontWeight);
}
normal2TextStyle(
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: Get.width * 0.042, color: color, fontWeight: fontWeight);
}
normalTextStyle(
    {Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.03 : Get.width * 0.039,
      color: color,
      
      letterSpacing: letterSpacing,
      fontWeight: fontWeight);
}

// normalTextStyleForAll(BuildContext context,
//     {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
//   return TextStyle(
//       fontSize: getValueForScreenType<double>(
//         context: context,
//         mobile: Get.width * 0.03,
//         tablet: screenHeight * 0.023,
//         desktop: screenHeight * 0.023,
//       ),
//       color: color,
//       fontWeight: fontWeight);
// }

midNormalTextStyle(
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.028 : Get.width * 0.037,
      color: color,
      fontWeight: fontWeight);
}

smallTextStyle(
    {Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.025 : Get.width * 0.034,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing);
}

extraSmallTextStyle(
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.022 : Get.width * 0.031,
      color: color,
      fontWeight: fontWeight);
}
extraSmallSmallTextStyle(
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: Get.width * 0.02, color: color, fontWeight: fontWeight);
}
subTitleStyle({Color color = Colors.white}) {
  return TextStyle(
      fontSize: Get.width >= 600 ? Get.width * 0.023 : Get.width * 0.032,
      color: color);
}

// lightTextStyle(
//     {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
//   return TextStyle(
//       fontSize: Get.width * 0.03, color: color, fontWeight: fontWeight);
// }
