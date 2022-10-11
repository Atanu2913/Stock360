import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/screen/home/portfolio/equity/equity_screen.dart';
import 'package:mymoney/screen/home/watchlist/home_screen.dart';
import 'package:mymoney/utils/color.dart';

// ignore: must_be_immutable
class PortFolioScreen extends StatelessWidget {
  MyTabController myTabController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      resizeToAvoidBottomInset: false,
      appBar: appBarDesign(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: BottomAppBar(
              color: pageBackGroundC,
              elevation: 0,
              child: Center(
                child: TabBar(
                  // automaticIndicatorColorAdjustment: false,
                  // labelPadding: EdgeInsets.all(15),
                  // onTap: _onItemTapped,
                  labelColor: appColor,
                  
                  controller: myTabController.controller2,
                  unselectedLabelColor: white,
                  indicatorColor: appColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  isScrollable: false,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: appColor, width: 2),
                    // insets: EdgeInsets.only(bottom: 52),
                  ),
                  tabs: myTabController.myTabs3,
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: white,
                    fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height > 891
                ? Get.height / 1.312
                : Get.height / 1.394 /* tablet:Get.height / 1.34*/,
            color: pageBackGroundC,
            child: TabBarView(
              controller: myTabController.controller2,
              children: [
                EquityScreen(),
                Text("2"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
