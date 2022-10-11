import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/home/watchlist/home_screen.dart';
import 'package:mymoney/screen/home/watchlist/watchlist_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:mymoney/utils/utils_text.dart';

class AllStockScreen extends StatefulWidget {
  @override
  State<AllStockScreen> createState() => _AllStockScreenState();
}

class _AllStockScreenState extends State<AllStockScreen> {
  List initList = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchInitStocks();
  }
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      progressIndicator: commonLoader(),
      child: Scaffold(
        appBar: appBarDesign(),
        backgroundColor: pageBackGroundC,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              color: pageBackGroundC,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 23,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, bottom: 18),
                    child: Text(
                      "All Stocks",
                      style: TextStyle(
                        fontSize: 18,
                        color: white,
                        fontFamily: "NunitoBold",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                       itemCount: initList.length,
                        itemBuilder: (context, index) => listViewItemDesign(
                          context: context,
                          image: initList[index]["icon_url"] ?? "",
                          title: initList[index]["name"] ?? "",
                          subTitle: initList[index]["primary_exchange"] ?? "",
                          total: initList[index]["getresult"]["current_price"]
                              .toString(),
                          stock1: initList[index]["getresult"]["up_down_price"]
                              .toString(),
                          stock2: initList[index]["getresult"]
                                  ["up_down_percentage"]
                              .toString(),
                          statusValue: initList[index]["getresult"]
                                  ["up_down_status"]
                              .toString(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  fetchInitStocks() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
             "user_id": sharedPreferences.getString(AllSharedPreferencesKey.userId),

      };
      apiPostRequest(data, AllUrls.tempActiveStock, this.context)
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
          if (jsonData["success"].toString() == "true") {
            initList=jsonData["result"];
            loading = false;
            setState(() {});   } else {
            setState(() {
              loading = false;
            });
            // commonAlertDialog(context, AllString.success, jsonData["message"]);
          }
        }
      });
    } else {
      showOfflineSnakbar(context);
    }
  }
}
