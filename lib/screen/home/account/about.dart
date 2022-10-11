import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/common/commonNoDataFound.dart';
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
import 'package:mymoney/utils/printValidString.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/textformfild.dart';
import 'package:mymoney/widget/button.dart';

class About extends StatefulWidget {
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool loading = false;
  List _aboutList = [];

  @override
  void initState() {
    super.initState();
    fetchAbout();
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
            color: white,
          ),
        ),
        title: Center(
          child: Text(
            "About",
            style: TextStyle(
              fontSize: 19,
              color: white,
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
          child: _aboutList.isEmpty
              ? commonNoDataFound()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _aboutList.length,
                  itemBuilder: (context, index) =>
                      customTile(_aboutList[index], index)),
        ),
      ),
    );
  }

  customTile(Map singleData, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            printValidString(singleData["page_title"]),
            maxLines: 2,
            style: TextStyle(
              fontSize: 18,
              color: white,
              fontFamily: "PoppinsRegular",
              fontWeight: FontWeight.w700,
            ),
          ),
          Html(
            data: printValidString(singleData["page_content"]),
          ),
        ],
      ),
    );
  }

  fetchAbout() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {};
      apiPostRequest(data, AllUrls.about, this.context).then((response) {
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
            _aboutList = jsonData["result"];

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
