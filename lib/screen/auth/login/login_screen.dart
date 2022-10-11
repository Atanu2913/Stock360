import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonAlertDialogForBackPressToClose.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/controller/checkbox_controller.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/auth/forgetpassword/forgetpassword_screen.dart';
import 'package:mymoney/screen/auth/signup/signup_screen.dart';
import 'package:mymoney/screen/auth/verification.dart';
import 'package:mymoney/screen/home/drawer_open_.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/otherUtils.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';

// ignore: must_be_immutable
class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  CheckBoxController checkBoxController = Get.put(CheckBoxController());
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        commonAlertDialogForBackPressToClose(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: pageBackGroundC,
        body: LoadingOverlay(
          isLoading: loading,
          progressIndicator: commonLoader(),
          child: Stack(
            children: [
              Container(
                color: pageBackGroundC,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height / 14),
                    child: Column(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 26,
                            color: white,
                            fontFamily: "NunitoBold",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: Get.height / 29.714),
                          child: SvgPicture.asset(
                            loginBenner,
                            height: Get.height / 3.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height / 2.20),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 15.23,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height / 17.47,
                          ),
                          textFromFieldDesign1(
                            _emailTextEditingController,
                            hint: "Email",
                            onChange: (_) {
                              setState(() {});
                            },
                            iconWidget: Icon(
                              Icons.email_outlined,
                              color: white,
                              size: 27,
                            ),
                            iconWidget1: Icon(
                              Icons.visibility_outlined,
                              color: transPrent,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 31.83,
                          ),
                          PassowrdTextField(
                            _passwordTextEditingController,
                            hint: "Password",
                            onChange: (_) {
                              setState(() {});
                            },
                            iconWidget: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                lockIcon,
                                color: white,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(
                                () => Checkbox(
                                  value: checkBoxController.isCheck.value,
                                  activeColor: appColor,
                                  fillColor: MaterialStateProperty.all(white),
                                  checkColor: appGreen,
                                  onChanged: (val) {
                                    checkBoxController.isCheck.value =
                                        !checkBoxController.isCheck.value;
                                  },
                                ),
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                  color: white.withOpacity(0.6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "MontserratRegular",
                                ),
                              ),
                              SizedBox(
                                width: 30 /*tablet:110*/,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    ForGetPassword(),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: white.withOpacity(0.6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "MontserratRegular",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height / 16.20,
                          ),
                          button(context, text: "Log In", function: () {
                            loginUser();
                          }, enable: validateAndProceed()),
                          SizedBox(
                            height: Get.height / 74.28,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Nunito",
                                  color: white,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    SignUpScreen(),
                                  );
                                  print("Sign Up");
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: appColor,
                                    fontFamily: "NunitoSemiBold",
                                  ),
                                ),
                              ),
                            ],
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
      ),
    );
  }

  bool validateAndProceed() {
    if (_emailTextEditingController.text.isEmpty ||
        !validateEmail(_emailTextEditingController.text) ||
        _passwordTextEditingController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  loginUser() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "username": _emailTextEditingController.text,
        "password": _passwordTextEditingController.text,
        "device_token": ""
      };
      apiPostRequest(data, AllUrls.login, this.context).then((response) {
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
            log(jsonData.toString());
            loading = false;
            setState(() {});
            sharedPreferences.setString(AllSharedPreferencesKey.userId,
                jsonData["result"][0]["id"].toString());
            sharedPreferences.setString(AllSharedPreferencesKey.roleId,
                jsonData["result"][0]["role_id"].toString());
            sharedPreferences.setString(AllSharedPreferencesKey.fullName,
                jsonData["result"][0]["full_name"].toString());
            sharedPreferences.setString(AllSharedPreferencesKey.mobileNo,
                jsonData["result"][0]["mobile_no"].toString());
            sharedPreferences.setString(AllSharedPreferencesKey.email,
                jsonData["result"][0]["email"].toString());
            sharedPreferences.setString(AllSharedPreferencesKey.address,
                jsonData["result"][0]["address"] ?? "");
            sharedPreferences.setString(AllSharedPreferencesKey.city,
                jsonData["result"][0]["city"] ?? "");
            sharedPreferences.setString(AllSharedPreferencesKey.zip,
                jsonData["result"][0]["zip"] ?? "");
            sharedPreferences.setString(AllSharedPreferencesKey.walletBalance,
                jsonData["result"][0]["wallet_balance"].toString());
            Get.to(
              DrawerOpenScreen(),
            );
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
