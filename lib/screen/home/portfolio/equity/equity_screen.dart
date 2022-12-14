import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/screen/home/portfolio/equity/bookedPL.dart';
import 'package:mymoney/utils/color.dart';

import 'current_screen.dart';
import 'holding_screen.dart';

// ignore: must_be_immutable
class EquityScreen extends StatelessWidget {
  MyTabController myTabController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackGroundC,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: pageBackGroundC,
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: TabBar(
            // automaticIndicatorColorAdjustment: false,
            // labelPadding: EdgeInsets.all(15),
            // onTap: _onItemTapped,
            labelColor: appColor,
            controller: myTabController.controller4,
            unselectedLabelColor: white,
            indicatorColor: appColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            // isScrollable: false,
            physics: NeverScrollableScrollPhysics(),
            // labelPadding: EdgeInsets.only(right: 40),
            indicator: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xff40000000).withOpacity(0.1),
              //     offset: Offset(0.5, 3),
              //     blurRadius: 5,
              //     spreadRadius: 0.2,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(40),
              color: pageBackGroundC,
            ),
            tabs: myTabController.myTabs4,
            labelStyle: TextStyle(
              fontSize: 12,
              color: white,
              fontFamily: "PoppinsMedium",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: myTabController.controller4,
        children: [
          CurrentScreen(),
          HoldingScreen(),
          BookedPLScreen(),
        ],
      ),
    );
  }
}
