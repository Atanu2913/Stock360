import 'dart:convert';
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/controller/tabcontroller_screen.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/home/watchlist/all_stocks_screen.dart';
import 'package:mymoney/screen/home/watchlist/buy_sell_screen.dart';
import 'package:mymoney/screen/home/watchlist/home_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';

import '../notification_screen.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  final MyTabController myTabController = Get.put(MyTabController());
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
      child: SingleChildScrollView(
        child: Container(
          color: pageBackGroundC,
          child: Column(
            children: [
              appBarDesign(),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 20.57, top: Get.height / 178.28),
                  child: InkWell(
                    onTap: () {
                      Get.to(NotificationScreen());
                    },
                    child: SvgPicture.asset(
                      bellhome,
                    ),
                  ),
                ),
              ),
              Container(
                color: pageBackGroundC,
                height: Get.height / 2.80,
                child: TabBarView(
                  controller: myTabController.controller,
                  children: [
                    tabView1(),
                    Text(Get.height.toString()),
                    Text(Get.width.toString()),
                    Text("cj"),
                    Text("cj"),
                  ],
                ),
              ),
              Container(
                height: Get.height / 13.42,
                width: Get.width,
                child: BottomAppBar(
                  // notchMargin: 0,
                  notchMargin: 5.0,
                  color: pageBackGroundC,
                  elevation: 0,
                  child: TabBar(
                    // labelPadding: EdgeInsets.all(0),
                    // onTap: _onItemTapped,
                    labelColor: appColor,
                    controller: myTabController.controller,
                    unselectedLabelColor: white,
                    indicatorColor: appColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    isScrollable: false,
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: appColor, width: 2),
                      // insets: EdgeInsets.only(bottom: 52),
                    ),
                    tabs: myTabController.myTabs,
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: white,
                      fontFamily: "NunitoSemiBold",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 44.57,
              ),
              Container(
                height:
                    Get.height * 1.2 /*(Get.height > 891) ? Get.height : 275*/,
                width: Get.width,
                decoration: BoxDecoration(
                  color: pageBackGroundC,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: Get.width / 31.64,
                          top: Get.height / 89.14,
                          left: Get.width / 31.64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stocks",
                            style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontFamily: "NunitoBold",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllStockScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 15,
                                color: appColor,
                                fontFamily: "NunitoSemiBold",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                    Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: grayF2F2F2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: Get.width / 31.64, left: Get.width / 31.64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Most Active Stock",
                            style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontFamily: "NunitoBold",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllStockScreen(),
                                ),
                              );*/
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 15,
                                color: appColor,
                                fontFamily: "NunitoSemiBold",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
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
                    Padding(
                      padding: EdgeInsets.only(
                          right: Get.width / 31.64, left: Get.width / 31.64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Visited Stocks",
                            style: TextStyle(
                              fontSize: 18,
                              color: white,
                              fontFamily: "NunitoBold",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllStockScreen(),
                                ),
                              );*/
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 15,
                                color: appColor,
                                fontFamily: "NunitoSemiBold",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 6.5,
                        right: 6.5,
                        bottom: Get.height / 99.04,
                      ),
                      padding: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        top: 9,
                        bottom: 9,
                      ),
                      height: 62,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: pageBackGroundC,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff26000000).withOpacity(0.1),
                            spreadRadius: 0.1,
                            blurRadius: 3,
                            offset: Offset(0.5, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          lastContainerDesign(
                            text1: "TCS",
                            mainColor: redEB5757,
                            text2: "215.15",
                            richText1: "+13.00",
                            richText2: "+0.14%",
                          ),
                          lastContainerDesign(
                            text1: "WIPRO",
                            mainColor: green219653,
                            text2: "456.40",
                            richText1: "+13.00",
                            richText2: "+0.01%",
                          ),
                          lastContainerDesign(
                            text1: "SUNPHARMA",
                            mainColor: green219653,
                            text2: "895.78",
                            richText1: "+52.00",
                            richText2: "+2.52%",
                          ),
                          lastContainerDesign(
                            text1: "CIPLA",
                            mainColor: redEB5757,
                            text2: "1454.78",
                            richText1: "+15.00",
                            richText2: "+5.52%",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
            log(jsonData.toString());
            initList = jsonData["result"];
            loading = false;
            setState(() {});
          } else {
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

final List<Color> gradientColors = [
  const Color(0xff73BE8C),
  const Color(0xff73BE8C),
];

lastContainerDesign(
    {String text1,
    Color mainColor,
    String text2,
    String richText1,
    String richText2}) {
  return Container(
    width: 82 /*tablet:80*/,
    child: Row(
      children: [
        VerticalDivider(
          color: mainColor,
          thickness: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 9,
                color: white,
                fontFamily: "NunitoBold",
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 12,
                color: mainColor,
                fontFamily: "NunitoSemiBold",
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: richText1,
                    style: TextStyle(
                      fontSize: 8,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "(",
                    style: TextStyle(
                      fontSize: 8,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: richText2,
                    style: TextStyle(
                      fontSize: 8,
                      color: mainColor,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: ")",
                    style: TextStyle(
                      fontSize: 8,
                      color: white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

tabView1() {
  return Column(
    children: [
      Text(
        "NIFTY 50",
        style: TextStyle(
          fontSize: 28,
          color: white,
          fontFamily: "NunitoSemiBold",
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        "24,825.90",
        style: TextStyle(
          fontSize: 28,
          color: green219653,
          fontFamily: "NunitoBold",
          fontWeight: FontWeight.w400,
        ),
      ),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "+13.00",
              style: TextStyle(
                fontSize: 15,
                color: white,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: "(",
              style: TextStyle(
                fontSize: 15,
                color: white,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: "+0.14%",
              style: TextStyle(
                fontSize: 15,
                color: green219653,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ")",
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
      Padding(
        padding: const EdgeInsets.only(top: 28),
        child: SizedBox(
          height: Get.height / 5.57,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              titlesData: FlTitlesData(show: false),

              // showingTooltipIndicators: true,
              // titlesData: LineTitles.getTitleData(),
              gridData: FlGridData(
                show: false,
                // getDrawingHorizontalLine: (value) {
                //   return FlLine(
                //     color: transPrent,
                //     strokeWidth: 1,
                //   );
                // },
                drawVerticalLine: false,
                // getDrawingVerticalLine: (value) {
                //   return FlLine(
                //     color: transPrent,
                //     strokeWidth: 1,
                //   );
                // },
              ),
              borderData: FlBorderData(
                show: false,
                // border: Border.all(color: transPrent, width: 1),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(2.6, 2),
                    FlSpot(4.9, 5),
                    FlSpot(6.8, 2.5),
                    FlSpot(8, 4),
                    FlSpot(9.5, 3),
                    FlSpot(11, 4),
                  ],
                  isCurved: true,
                  colors: gradientColors,
                  barWidth: 2,
                  dotData: FlDotData(show: false),

                  // belowBarData: BarAreaData(
                  //     // show: true,
                  //     // colors: gradientColors
                  //     //     .map((color) => color.withOpacity(0.3))
                  //     //     .toList(),
                  //     ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

listViewItemDesign(
    {String image,
    String title,
    String subTitle,
    String total,
    String stock1,
    String stock2,
    BuildContext context,
    String statusValue}) {
  return InkWell(
    onTap: () {
      Get.to(BuySellScreen());
    },
    child: Container(
      margin: EdgeInsets.only(
        left: Get.width / 34.28,
        right: Get.width / 34.28,
        bottom: Get.height / 99.04,
      ),
      padding: EdgeInsets.only(
        left: Get.width / 68.57,
        right: Get.width / 37.40,
        top: Get.height / 127.34,
        bottom: Get.height / 99.04,
      ),
      // height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: pageBackGroundC,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xff26000000).withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 3,
            offset: Offset(0.5, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * 0.1,
            height: Get.width * 0.1,
            child: Image(
              image: NetworkImage(image),
              width: Get.width * 0.1,
              height: Get.width * 0.1,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: white,
                    fontFamily: "NunitoSemiBold",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: gray4,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: 84,
          //   height: 29,
          //   child: LineChart(
          //     LineChartData(
          //       minX: 0,
          //       maxX: 11,
          //       minY: 0,
          //       maxY: 6,
          //       titlesData: FlTitlesData(show: false),
          //       gridData: FlGridData(
          //         show: false,
          //         drawVerticalLine: false,
          //       ),
          //       borderData: FlBorderData(
          //         show: false,
          //       ),
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: [
          //             FlSpot(0, 3),
          //             FlSpot(2.6, 2),
          //             FlSpot(4.9, 5),
          //             FlSpot(6.8, 2.5),
          //             FlSpot(8, 6),
          //             FlSpot(9.5, 7),
          //             FlSpot(11, 7),
          //           ],
          //           isCurved: true,
          //           colors: gradientColors,
          //           barWidth: 2,
          //           dotData: FlDotData(show: false),
          //           belowBarData: BarAreaData(
          //             show: true,
          //             colors: [
          //               const Color(0xff73BE8C).withOpacity(0.4),
          //               const Color(0xf73BE8C),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),

          Container(
            width: Get.width * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  total,
                  style: TextStyle(
                    fontSize: 15,
                    color: statusValue == "0" ? Colors.green : Colors.red,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: statusValue == "0" ? "+" +stock1: "-" + stock1,
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " (",
                        style: TextStyle(
                          fontSize: 15,
                          color: white,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: statusValue == "0" ? "+"+stock2 : "-" + stock2,
                        style: TextStyle(
                          fontSize: 15,
                          color: statusValue == "0" ? Colors.green : Colors.red,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: ")",
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

listViewItemDesignMostStock(
    {String image,
    String title,
    String subTitle,
    String total,
    String stock1,
    String stock2,
    BuildContext context,
    colorName}) {
  return InkWell(
    onTap: () {
      Get.to(BuySellScreen());
    },
    child: Container(
      margin: EdgeInsets.only(
        left: Get.width / 34.28,
        right: Get.width / 34.28,
        bottom: Get.height / 99.04,
      ),
      padding: EdgeInsets.only(
        left: Get.width / 68.57,
        right: Get.width / 37.40,
        top: Get.height / 127.34,
        bottom: Get.height / 99.04,
      ),
      height: 60,
      width: Get.width,
      decoration: BoxDecoration(
        color: pageBackGroundC,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xff26000000).withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 3,
            offset: Offset(0.5, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(image),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontFamily: "NunitoSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 13,
                  color: gray4,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            width: 84,
            height: 29,
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 6,
                titlesData: FlTitlesData(show: false),
                gridData: FlGridData(
                  show: false,
                  drawVerticalLine: false,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(2.6, 2),
                      FlSpot(4.9, 5),
                      FlSpot(6.8, 2.5),
                      FlSpot(8, 6),
                      FlSpot(9.5, 7),
                      FlSpot(11, 7),
                    ],
                    isCurved: true,
                    colors: gradientColors,
                    barWidth: 2,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [
                        const Color(0xff73BE8C).withOpacity(0.4),
                        const Color(0xf73BE8C),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: TextStyle(
                  fontSize: 15,
                  color: colorName,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: stock1,
                      style: TextStyle(
                        fontSize: 15,
                        color: white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(",
                      style: TextStyle(
                        fontSize: 15,
                        color: white,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: stock2,
                      style: TextStyle(
                        fontSize: 15,
                        color: colorName,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: ")",
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
            ],
          ),
        ],
      ),
    ),
  );
}
