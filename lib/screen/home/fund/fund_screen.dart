import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/screen/home/fund/addFund.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';

class FundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: pageBackGroundC,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height / 14.85),
              child: Column(
                children: [
                  Text(
                    "Funds",
                    style: TextStyle(
                      fontSize: 26,
                      color: white,
                      fontFamily: "NunitoBold",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "( Cash + Collateral )",
                    style: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              height: Get.height / 1.33,
              decoration: BoxDecoration(
                color: pageBackGroundC,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22.56),
                  topRight: Radius.circular(22.56),
                ),
                /*   image: DecorationImage(
                  image: AssetImage(bg1),
                  fit: BoxFit.cover,
                ),*/
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: Get.height / 74.285,
                ),
                child: Column(
                  children: [
                    Text(
                      "Available margin",
                      style: TextStyle(
                        fontSize: 17,
                        color: gray,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "₹ " +
                          sharedPreferences
                              .getString(AllSharedPreferencesKey.walletBalance),
                      style: TextStyle(
                        fontSize: 21,
                        color: appColor,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height / 97.42,
                        left: Get.width / 25.71,
                        right: Get.width / 41.14,
                      ),
                      child: Divider(
                        color: gray,
                        thickness: 1,
                      ),
                    ),
                    design1(text1: "Opening balance", text2: "2,4389"),
                    design1(text1: "Payin", text2: "0.00"),
                    design1(text1: "Span", text2: "0,0015 BTC"),
                    design1(text1: "Delivery Margin", text2: "0.00"),
                    design1(text1: "Option Primum", text2: "0.00"),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10.28, left: 16, top: 10),
                      child: Divider(
                        color: gray,
                        thickness: 1,
                      ),
                    ),
                    design1(text1: "Total Collateral", text2: "0.00"),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addFundButton(
                              onTapButton: () {
                                Get.to(AddFund());
                              },
                              textLabel: "Add Funds"),
                          SizedBox(
                            width: Get.width / 41.14,
                          ),
                          withFundButton(
                              onTapButton: () {}, textLabel: "Withdraw"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

design1({String text1, String text2}) {
  return Padding(
    padding: EdgeInsets.only(
      left: Get.width / 17.19,
      right: Get.width / 22.63,
      top: Get.height / 89.14,
    ),
    child: Container(
      height: Get.height / 14.91,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 16,
              color: white.withOpacity(0.6),
              fontFamily: "NunitoSemiBold",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            text2,
            style: TextStyle(
              fontSize: 18,
              color: white,
              fontFamily: "NunitoSemiBold",
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    ),
  );
}
