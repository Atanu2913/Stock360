
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';

normalIcon(IconData icon, {Color color = Colors.white}) {
  return Icon(
    icon,
    color: color,
    size: Get.width * 0.045,
  );
}

smallIcon(IconData icon, {Color color = Colors.white}) {
  return Icon(
    icon,
    color: color,
    size: Get.width * 0.035,
  );
}

largeIcon(IconData icon, {Color color = Colors.white}) {
  return Icon(
    icon,
    color: color,
    size: Get.width * 0.1,
  );
}

mediumIcon(IconData icon, {Color color = Colors.white}) {
  return Icon(
    icon,
    color: color,
    size: Get.width * 0.06,
  );
}
