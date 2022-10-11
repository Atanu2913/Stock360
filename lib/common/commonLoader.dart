import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/utils/allText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//*****************
//
// custom Loader for button click
//
//*****************
// loaderFadingCudeRed() {
//   return Center(
//       child: Container(
//     padding: EdgeInsets.all(Get.width * 0.03),
//     width: Get.width * 0.4,
//     height: Get.width * 0.4,
//     // decoration: BoxDecoration(boxShadow: [
//     //   BoxShadow(
//     //     color: AllColor.greyColor.withOpacity(0.5),
//     //     spreadRadius: 5,
//     //     blurRadius: 7,
//     //     offset: Offset(0, 3), // changes position of shadow
//     //   ),
//     // ], borderRadius: BorderRadius.circular(1000), color: AllColor.primaryColor),
//     // child: CircularProgressIndicator(
//     //   valueColor: AlwaysStoppedAnimation<Color>(AllColor.white),
//     // ),
//     // child: SpinKitThreeBounce(
//     child: SpinKitFadingCube(
//       size: Get.width * 0.1,
//       color: AllColor.red,
//     ),
//   ));
// }

//*****************
//
// custom Loader for Loading
//
//*****************
commonLoader() {
  return Center(
      child: Container(
    padding: EdgeInsets.all(Get.width * 0.03),
    width: Get.width * 0.4,
    height: Get.width * 0.4,
    child: SpinKitCircle(
      size: Get.width * 0.1,
      color: AllColor.white,
    ),
  ));
}

commonLoaderWithPercentage(String percentage) {
  return Center(
      child: Container(
    // padding: EdgeInsets.all(Get.width * 0.03),
    width: Get.width * 0.4,
    height: Get.width * 0.4,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Get.width * 0.25,
          height: Get.width * 0.25,
          child: CircularProgressIndicator(
            color: AllColor.deepGreen,
          ),
        ),
        Container(
          width: Get.width * 0.3,
          alignment: Alignment.center,
          child: headingText(percentage, color: AllColor.greyColor),
        )
      ],
    ),
    // child: SpinKitChasingDots(
    //   size: Get.width * 0.1,
    //   color: AllColor.white,
    // ),
  ));
}
// loaderWaveOrange() {
//   return Center(
//       child: Container(
//     padding: EdgeInsets.all(Get.width * 0.03),
//     width: Get.width * 0.4,
//     height: Get.width * 0.4,
//     // decoration: BoxDecoration(boxShadow: [
//     //   BoxShadow(
//     //     color: AllColor.greyColor.withOpacity(0.5),
//     //     spreadRadius: 5,
//     //     blurRadius: 7,
//     //     offset: Offset(0, 3), // changes position of shadow
//     //   ),
//     // ], borderRadius: BorderRadius.circular(1000), color: AllColor.primaryColor),
//     // child: CircularProgressIndicator(
//     //   valueColor: AlwaysStoppedAnimation<Color>(AllColor.white),
//     // ),
//     // child: SpinKitThreeBounce(
//     child: SpinKitWave(
//       // child: SpinKitFadingCube(
//       size: Get.width * 0.1,
//       color: AllColor.orange,
//     ),
//   ));
// }
