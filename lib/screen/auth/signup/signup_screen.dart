import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/auth/login/login_screen.dart';
import 'package:mymoney/screen/auth/signup/email_verification.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/otherUtils.dart';
import 'package:mymoney/utils/round_container.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';

import 'creatpin_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  // TextEditingController _lastNameTextEditingController =
  //     TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _phoneTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Create Account",
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
              alignment: Alignment.topCenter,
              color: pageBackGroundC,
              height: Get.height,
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: Get.height / 23.45),
                child:
                    SvgPicture.asset(signUPBenner, height: Get.height / 4.43),
              ),
            ),
            Positioned(
              top: Get.height / 3.71,
              bottom: 0.0,
              child: Container(
                height: Get.height / 1.59,
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
                      horizontal: Get.width / 17.14,
                      vertical: Get.height / 22.28),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        textFromFieldDesign1(
                          _nameTextEditingController,
                          hint: "Full Name",
                          onChange: (_) {
                            setState(() {});
                          },
                          iconWidget: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              user,
                              color: appGreen,
                            ),
                          ),
                          iconWidget1: Icon(
                            Icons.visibility_outlined,
                            color: transPrent,
                          ),
                        ),
                        // SizedBox(
                        //   height: Get.height / 31.83,
                        // ),
                        // textFromFieldDesign1(
                        //   _lastNameTextEditingController,
                        //   hint: "Last Name",
                        //   iconWidget: Padding(
                        //     padding: const EdgeInsets.all(12),
                        //     child: SvgPicture.asset(
                        //       user,
                        //       color: gray9B9797,
                        //     ),
                        //   ),
                        //   iconWidget1: Icon(
                        //     Icons.visibility_outlined,
                        //     color: transPrent,
                        //   ),
                        // ),
                        SizedBox(
                          height: Get.height / 31.83,
                        ),
                        textFromFieldDesign1(
                          _phoneTextEditingController,
                          hint: "Phone",
                          maxNumber: 10,
                          onChange: (_) {
                            setState(() {});
                          },
                          number: true,
                          iconWidget: Icon(
                            Icons.phone,
                            color: appGreen,
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
                              color: appGreen,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height / 17.82,
                        ),
                        button(
                          context,
                          text: "Sign Up",
                          enable: validateAndProceed(),
                          function: () {
                            if (validateAndProceed()) {
                              userRegistration();
                            } else {
                              commonAlertDialog(context, AllString.warning,
                                  "Please fill the all fields");
                            }
                            // Get.to(
                            //   CreatePinScreen(),
                            // );
                          },
                        ),
                        SizedBox(
                          height: Get.height / 55.71,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Nunito",
                                color: white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                                print("Sign Up");
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15,
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
    );
  }

  bool validateAndProceed() {
    if (_nameTextEditingController.text.isEmpty ||
        _phoneTextEditingController.text.isEmpty ||
        _emailTextEditingController.text.isEmpty ||
        !validateEmail(_emailTextEditingController.text) ||
        _passwordTextEditingController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  userRegistration() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "user_type": "1",
        "full_name": _nameTextEditingController.text.toString(),
        "mobile_no": _phoneTextEditingController.text.toString(),
        "email": _emailTextEditingController.text.toString(),
        "password": _passwordTextEditingController.text.toString(),
        "device_token": "",
      };
      apiPostRequest(data, AllUrls.registration, this.context).then((response) {
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

            clearValue();
            Get.off(
              // LogInScreen(),

              EmailVerification(
                userId: jsonData['result'][0]["id"].toString(),
                otp: jsonData['result'][0]["user_otp"].toString(),
                email: _emailTextEditingController.text,
              ),
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
