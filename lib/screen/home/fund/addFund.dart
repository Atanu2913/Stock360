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
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/home/drawer_open_.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';

class AddFund extends StatefulWidget {
  @override
  State<AddFund> createState() => _AddFundState();
}

class _AddFundState extends State<AddFund> {
  bool loading = false;
  TextEditingController _fundTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
        centerTitle: true,
        backgroundColor: pageBackGroundC,
        title: Text(
          "Add Wallet",
          style: TextStyle(
            fontSize: 25,
            color: white,
            fontFamily: "NunitoBold",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LoadingOverlay(
        isLoading: loading,
        progressIndicator: commonLoader(),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Get.height / 7),
              child: Container(
                height: Get.height / 1.35,
                width: Get.width,
                decoration: BoxDecoration(
                  color: pageBackGroundC,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height / 31.83,
                        ),
                        textFromFieldDesign1(
                          _fundTextEditingController,
                          hint: "Amount",
                          onChange: (_) {
                            setState(() {});
                          },
                          number: true,
                          iconWidget: Icon(
                            Icons.money,
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
                        SizedBox(
                          height: Get.height / 17.82,
                        ),
                        button(
                          context,
                          text: "Add",
                          // enable: validateAndProceed(),
                          function: () {
                            addMoney();
                          },
                        ),
                        /*Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(backgroundColor: Colors.lightBlue,),
                      ),*/
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
    if (_fundTextEditingController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  addMoney() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "user_id": sharedPreferences.getString(AllSharedPreferencesKey.userId),
        "amount": _fundTextEditingController.text.toString(),
        "payment_id": ""
      };
      apiPostRequest(data, AllUrls.addbalance, this.context).then((response) {
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
            commonAlertDialog(context, AllString.success, jsonData["message"],
                function: () {
              Get.to(
                DrawerOpenScreen(),
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

personalDesign1({String textLabel, String hintText}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 76,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textLabel,
            style: TextStyle(
              fontSize: 15,
              color: white.withOpacity(0.6),
              fontFamily: "NunitoSemiBold",
              fontWeight: FontWeight.w600,
            ),
          ),
          TextFormField(
            style: TextStyle(
              color: white,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w400,
            ),
            cursorColor: appColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: white,
                fontSize: 19,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffE7E8EB),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
