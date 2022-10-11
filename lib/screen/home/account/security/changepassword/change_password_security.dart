import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/controller/checkbox_controller.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/auth/login/login_screen.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';
import 'well_done_changepassword_screen.dart';

// ignore: must_be_immutable
class ChangePasswordSecurity extends StatefulWidget {
  @override
  State<ChangePasswordSecurity> createState() => _ChangePasswordSecurityState();
}

class _ChangePasswordSecurityState extends State<ChangePasswordSecurity> {
  // CheckBoxController checkBoxController = Get.find();
  bool loading = false;

  TextEditingController _passwordTextEditingController =
      TextEditingController();

  TextEditingController _oPasswordTextEditingController =
      TextEditingController();

  TextEditingController _cPasswordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.back,
            color: white,
          ),
        ),
        elevation: 0,
        backgroundColor: pageBackGroundC,
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 38),
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: pageBackGroundC,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 31.83,
              ),
              PassowrdTextField(
                _oPasswordTextEditingController,
                hint: "Current password",
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
                height: Get.height / 31.83,
              ),
              PassowrdTextField(
                _passwordTextEditingController,
                hint: "New password",
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
                height: Get.height / 31.83,
              ),
              PassowrdTextField(
                _cPasswordTextEditingController,
                hint: "Repeat password",
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
                text: "Change Password",
                enable: validateAndProceed(),
                function: () {
                  changePassword();
                },
              ),
              SizedBox(
                height: Get.height / 55.71,
              ),

              // Padding(
              //   padding: EdgeInsets.only(top: 30),
              //   child: Obx(
              //     () => checkBoxController.isChange.isTrue
              //         ? loginButton(
              //             textLabel: "Change Password",
              //             onTapButton: () {
              //               Get.to(ChangePasswordWellDone());
              //               checkBoxController.isChange(false);
              //             },
              //           )
              //         : Container(
              //             decoration: BoxDecoration(
              //               border: Border.all(color: gray, width: 1),
              //               borderRadius: BorderRadius.all(
              //                 Radius.circular(25),
              //               ),
              //             ),
              //             child: MaterialButton(
              //               height: 49,
              //               minWidth: 201,
              //               onPressed: () {
              //                 checkBoxController.isChange(true);
              //               },
              //               color: white,
              //               elevation: 0,
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadiusDirectional.circular(
              //                   25,
              //                 ),
              //               ),
              //               child: Text(
              //                 "Change Password",
              //                 style: TextStyle(
              //                   color: gray,
              //                   fontSize: 19,
              //                   fontFamily: "NunitoSemiBold",
              //                   fontWeight: FontWeight.w600,
              //                 ),
              //               ),
              //             ),
              //           ),
              //   ), /*loginButton(
              //     textLabel: "Change Password",
              //     onTapButton: () {
              //       Get.to(EnterOldPinScreen());
              //     },
              //   ),*/
              // ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndProceed() {
    if (_oPasswordTextEditingController.text.isEmpty ||
        _passwordTextEditingController.text.isEmpty ||
        _cPasswordTextEditingController.text.isEmpty ||
        _passwordTextEditingController.text !=
            _cPasswordTextEditingController.text) {
      return false;
    } else {
      return true;
    }
  }

  changePassword() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "user_id": sharedPreferences.getString(AllSharedPreferencesKey.userId),
        "old_password": _oPasswordTextEditingController.text.toString(),
        "new_password": _passwordTextEditingController.text.toString(),
      };
      apiPostRequest(data, AllUrls.changepassword, this.context)
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
            sharedPreferences.setString(AllSharedPreferencesKey.userId, "");
            commonAlertDialog(context, AllString.success, jsonData["message"],
                function: () {
              Get.to(
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
