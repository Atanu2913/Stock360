import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/common/commonNoDataFound.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/checkApiValueValid.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/printValidString.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/utils_text.dart';
import 'package:timeago/timeago.dart' as timeago;
class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List _notificationList = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: pageBackGroundC,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        title: Center(
          child: Text(
            "Notification",
            style: TextStyle(
              fontSize: 19,
              color: black222222,
              fontFamily: "poppinsMedium",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: LoadingOverlay(
        isLoading: loading,
        progressIndicator: commonLoader(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child:_notificationList.isEmpty? commonNoDataFound(): ListView.builder(
            shrinkWrap: true,
            itemCount: _notificationList.length,
            itemBuilder: (context, index) =>  customTile(_notificationList[index], index)
          ),
        ),
      ),
    );
  }
customTile(Map singleData,int index){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // CircleAvatar(
        //   backgroundColor: appColor,
        //   maxRadius: 24,
        //   child: SvgPicture.asset(svgUrl),
        // ),
        Container(
          width: Get.width*0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                printValidString( singleData["notification_title"])
               ,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 18,
                  color: black,
                  fontFamily: "PoppinsRegular",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                printValidString( singleData["notification_text"])
               ,
                maxLines: 5,
                style: TextStyle(
                  fontSize: 14,
                  color: gray,
                  fontFamily: "PoppinsRegular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Text(
          
           checkApiValueValid( singleData["created_time"])?AllString.na:
          timeago.format(DateTime.parse(singleData["created_time"]))
           ,
          style: TextStyle(
            fontSize: 14,
            color: grayABABAB,
            fontFamily: "PoppinsRegular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
  fetchNotification() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        "user_id": sharedPreferences.getString(AllSharedPreferencesKey.userId),
      };
      apiPostRequest(data, AllUrls.notificationlist, this.context)
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
            _notificationList = jsonData["result"];
            loading = false;
            setState(() {});
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
