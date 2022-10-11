import 'package:get/get.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/utils/allMargin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/allIcon.dart';
import 'package:mymoney/utils/allText.dart';
import 'package:mymoney/utils/allTextStyle.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/widget/button.dart';

commonAlertDialogForBackPressToClose(BuildContext context) {
  return showDialog(
      barrierDismissible: true, context: context, builder: (_) => DialogOver());
}

class DialogOver extends StatefulWidget {
  const DialogOver({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DialogOverState();
}

class DialogOverState extends State<DialogOver>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.linear);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scaleAnimation,
        child: WillPopScope(
          onWillPop: () async => true,
          child: SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              elevation: 0.0,
              backgroundColor: black,
              title: Container(
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Container(
                    child: normalText(AllString.appName,
                        color: AllColor.greyColor),
                  )),
              children: [
                SizedBox(
                  height: Get.width * 0.02,
                ),
                Container(
                    width: Get.width * 0.1,
                    height: Get.width * 0.1,
                    alignment: Alignment.center,
                    child: largeIcon(Icons.exit_to_app, color: AllColor.red)),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                Container(
                    padding: AllMargin.customMarginCardItem(),
                    margin: AllMargin.customVertical(),
                    width: Get.width,
                    alignment: Alignment.center,
                    child: Text("Are you sure you want to close this App",
                        textAlign: TextAlign.center,
                        style: headingTextStyle(color: AllColor.white))),
                SizedBox(
                  height: Get.width * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: Get.width * 0.3,
                          child:
                              button(context, text: AllString.no, function: () {
                            Navigator.pop(context);
                          }),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: Get.width * 0.3,
                          child: button(context, text: AllString.yes,
                              function: () {
                            SystemNavigator.pop();
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
              ]),
        ));
  }
}
