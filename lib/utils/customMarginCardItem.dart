import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';

EdgeInsets customMarginCardItem() {
  return EdgeInsets.symmetric(
      horizontal: Get.width * 0.03, vertical: Get.width * 0.015);
}


EdgeInsets customHorizontal() {
  return EdgeInsets.symmetric(
      horizontal: Get.width * 0.03);
}
EdgeInsets customVertical() {
  return EdgeInsets.symmetric(
      vertical: Get.width * 0.015);
}
SizedBox customSizedBox(){
  return SizedBox(
    height: Get.width * 0.015,
  );
} 