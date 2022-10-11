import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/utils/allTextStyle.dart';

headingText(String text,
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal,
     bool center = false,
    bool overflow = false,
    int maxLines}) {
  return Text(
    text,  maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: !center ? TextAlign.left : TextAlign.center,
    style: headingTextStyle(color: color, fontWeight: fontWeight),
  );
}

normal2Text(String text,
    {Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    bool center = false,
    bool overflow = false,
    int maxLines}) {
  return Text(
    text,
    maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: !center ? TextAlign.left : TextAlign.center,
    style: normal2TextStyle(color: color, fontWeight: fontWeight),
  );
}

normalText(String text,
    {Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
     bool center = false,
     bool justify = false,
    bool overflow = false,
    int maxLines}) {
  return Text(
    text,
        maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: center ? TextAlign.center:justify? TextAlign.justify:TextAlign.left,
    
    style: normalTextStyle(
        color: color, fontWeight: fontWeight, letterSpacing: letterSpacing),
  );
}

midNormalText(String text,
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal,
     bool center = false,
    bool overflow = false,
    int maxLines}) {
  return Text(
    text,  maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: !center ? TextAlign.left : TextAlign.center,
    style: midNormalTextStyle(color: color, fontWeight: fontWeight),
  );
}

smallText(String text,
    {Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
     bool center = false,
    bool overflow = false,
    int maxLines
    }) {
  return Text(
    text,
      maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: !center ? TextAlign.left : TextAlign.center,
    style: smallTextStyle(
        color: color, fontWeight: fontWeight, letterSpacing: letterSpacing),
  );
}
// smallTextForAll(BuildContext context, String text,
//     {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal}) {
//   return Text(
//     text,
//     style: TextStyle(
//       fontSize: getValueForScreenType<double>(
//                           context: context,
//                           mobile:Get.width * 0.025,
//                           tablet: Get.width * 0.02,
//                           desktop: Get.width * 0.02,
//                         ), color: color, fontWeight: fontWeight),
//   );
// }

extraSmallText(String text,
    {Color color = Colors.white, FontWeight fontWeight = FontWeight.normal,
     bool center = false,
    bool overflow = false,
    int maxLines}) {
  return Text(
    text,  maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
    textAlign: !center ? TextAlign.left : TextAlign.center,
    style: extraSmallTextStyle(color: color, fontWeight: fontWeight),
  );
}

subTitleText(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: Get.width * 0.028, color: Colors.grey),
  );
}
