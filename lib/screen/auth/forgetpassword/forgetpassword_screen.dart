import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/auth/login/login_screen.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/otherUtils.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';
import 'email_verification_forgetpassword.dart';

class ForGetPassword extends StatefulWidget {
  @override
  State<ForGetPassword> createState() => _ForGetPasswordState();
}

class _ForGetPasswordState extends State<ForGetPassword> {
  TextEditingController _emailTextEditingController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: LoadingOverlay(
        isLoading: loading,
        progressIndicator: commonLoader(),
        child: Stack(
          children: [
            Container(
              color: pageBackGroundC,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Enter your registrated email address to receive",
                      style: TextStyle(
                        fontSize: 15,
                        color: white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "password reset instruction",
                      style: TextStyle(
                        fontSize: 15,
                        color: white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Get.height / 44.57),
                      child: SvgPicture.asset(
                        forgetPinBenner,
                        height: Get.height / 3.87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height / 3),
              child: Container(
                height: Get.height / 1.7,
                width: Get.width,
                decoration: BoxDecoration(
                  color: pageBackGroundC,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 15.23,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height / 18.96,
                        ),
                        textFromFieldDesign1(
                          _emailTextEditingController,
                          hint: "Email",
                          onChange: (_) {
                            setState(() {});
                          },
                          iconWidget: Icon(
                            Icons.email_outlined,
                            color: appGreen,
                            size: 27,
                          ),
                          iconWidget1: Icon(
                            Icons.visibility_outlined,
                            color: transPrent,
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 5.94,
                        ),
                        button(
                          context,
                          text: "Reset Password",
                          enable: validateAndProceed(),
                          function: () {
                            forgotPaswword();
                          },
                        ),
                        // resetButton(
                        //   onTapButton: () {
                        //     Get.to(
                        //       EmailVerificationForgetScreen(),
                        //     );
                        //   },
                        //   textLabel: "",
                        // ),
                        SizedBox(
                          height: Get.height / 74.28,
                        ),
                        Text(
                          "Terms & Condition Apply",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "NunitoSemiBold",
                            color: white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndProceed() {
    if (_emailTextEditingController.text.isEmpty ||
        !validateEmail(_emailTextEditingController.text)) {
      return false;
    } else {
      return true;
    }
  }

  forgotPaswword() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "email": _emailTextEditingController.text.toString(),
      };
      apiPostRequest(data, AllUrls.forgotpassword, this.context)
          .then((response) {
        if (response == null) {
          loading = false;
          setState(() {});
          commonAlertDialog(
            context,
            AllString.error,
            AllString.serverError,
          );
        } else {
          Map<String, dynamic> jsonData = json.decode(response);
          if (checkApiResponseSuccessOrNot(jsonData)) {
            loading = false;
            setState(() {});

            commonAlertDialog(context, AllString.success, jsonData["message"],
                function: () {
              Get.off(
                LogInScreen(),
              );
            });
          } else {
            setState(() {
              loading = false;
            });
            commonAlertDialog(context, AllString.success, jsonData["message"]);
          }
        }
      });
    } else {
      showOfflineSnakbar(context);
    }
  }
}
