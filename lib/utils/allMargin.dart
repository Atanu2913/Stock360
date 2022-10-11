import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';

class AllMargin {
  static EdgeInsets customMarginCardItem() {
    return EdgeInsets.symmetric(
        horizontal: Get.width * 0.03, vertical: Get.width * 0.015);
  }
  static EdgeInsets customMarginCardItemSame() {
    return EdgeInsets.symmetric(
        horizontal: Get.width * 0.03, vertical: Get.width * 0.03);
  }
  static EdgeInsets customMarginCardItemSameSmall() {
    return EdgeInsets.symmetric(
        horizontal: Get.width * 0.015, vertical: Get.width * 0.015);
  }

  static EdgeInsets customHorizontal() {
    return EdgeInsets.symmetric(horizontal: Get.width * 0.03);
  }
  static EdgeInsets customRight() {
    return EdgeInsets.only(right: Get.width * 0.03);
  }
  static EdgeInsets customRightSmall() {
    return EdgeInsets.only(right: Get.width * 0.015);
  }
  static EdgeInsets customHorizontalSmall() {
    return EdgeInsets.symmetric(horizontal: Get.width * 0.01);
  }
  static EdgeInsets customLeft() {
    return EdgeInsets.symmetric(horizontal: Get.width * 0.015);
  }
  static EdgeInsets customVertical() {
    return EdgeInsets.symmetric(vertical: Get.width * 0.015);
  }
  static EdgeInsets customVerticalSmall() {
    return EdgeInsets.symmetric(vertical: Get.width * 0.01);
  }
  static EdgeInsets customVerticalExtraSmall() {
    return EdgeInsets.symmetric(vertical: Get.width * 0.005);
  }
  static EdgeInsets customBottom() {
    return EdgeInsets.only(bottom: Get.width * 0.03);
  }
  static EdgeInsets customBottomSmall() {
    return EdgeInsets.only(bottom: Get.width * 0.015);
  }
  static EdgeInsets customTop() {
    return EdgeInsets.only(top: Get.width * 0.03);
  }
  static EdgeInsets customSmallBottom() {
    return EdgeInsets.only(bottom: Get.width * 0.015);
  }
}
