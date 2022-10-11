import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mymoney/api/apiPostRequest.dart';
import 'package:mymoney/common/commonAlertDialog.dart';
import 'package:mymoney/common/commonAlertDialogForBackPressToClose.dart';
import 'package:mymoney/common/commonLoader.dart';
import 'package:mymoney/controller/conteiner_color_change_keypade.dart';
import 'package:mymoney/controller/drawer_open_controller.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allColor.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/res/allUrls.dart';
import 'package:mymoney/screen/home/account/account_screen.dart';
import 'package:mymoney/screen/home/fund/fund_screen.dart';
import 'package:mymoney/screen/home/order/order_screen.dart';
import 'package:mymoney/screen/home/portfolio/portfolio_screen.dart';
import 'package:mymoney/screen/home/watchlist/watchlist_screen.dart';
import 'package:mymoney/utils/checkApiResponseSuccessOrNot.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/imagenames.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;

  ColorChangeController colorChangeController =
      Get.put(ColorChangeController());
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey(),
    1: GlobalKey(),
    2: GlobalKey(),
    3: GlobalKey(),
    4: GlobalKey(),
  };

  ProfileController profileController = Get.put(ProfileController());

  DrawerOpen drawerOpen = Get.put(DrawerOpen());

  // ignore: missing_return
  systemBackButtonPressed() async {
    commonAlertDialogForBackPressToClose(context);
    return false;
    // if (navigatorKeys[profileController.selectedIndex.value]
    //     .currentState
    //     .canPop()) {
    //   navigatorKeys[profileController.selectedIndex.value].currentState.pop(
    //       navigatorKeys[profileController.selectedIndex.value].currentContext);
    // } else {
    //     commonAlertDialogForBackPressToClose(context);
    //   SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    // }
  }

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    print("Xscale:}");
    return Container(
      child: Obx(
        () => AnimatedContainer(
          height: Get.height,
          width: Get.width,
          curve: Curves.bounceOut,
          decoration: BoxDecoration(
            color: pageBackGroundC,
            boxShadow: [
              BoxShadow(
                color: Color(0xff40000000),
                spreadRadius: 0.5,
                blurRadius: 20,
              ),
            ],
          ),
          transform: Matrix4.translationValues(
            drawerOpen.xOffset.value,
            drawerOpen.yOffset.value,
            0,
          )..scale(drawerOpen.scaleFactor.value),
          duration: Duration(
            milliseconds: 250,
          ),
          child: WillPopScope(
            onWillPop: () async {
              commonAlertDialogForBackPressToClose(context);
              return true;
            },
            child: InkWell(
              onTap: () {
                drawerOpen.xOffset.value = 0;
                drawerOpen.yOffset.value = 0;
                drawerOpen.scaleFactor.value = 1.0;
                drawerOpen.isChange(false);
              },
              child: LoadingOverlay(
                isLoading: loading,
                progressIndicator: commonLoader(),
                child: Scaffold(
                  backgroundColor: pageBackGroundC,
                  resizeToAvoidBottomInset: false,
                  body: GetBuilder<ProfileController>(
                    init: ProfileController(),
                    builder: (s) => IndexedStack(
                      index: s.selectedIndex.value,
                      children: <Widget>[
                        // LogInScreen(),
                        NavigatorPage(
                          child: WatchListScreen(),
                          title: "Watch",
                          navigatorKey: navigatorKeys[0],
                        ),
                        NavigatorPage(
                          child: OrderScreen(),
                          title: "order",
                          navigatorKey: navigatorKeys[1],
                        ),
                        NavigatorPage(
                          child: PortFolioScreen(),
                          title: "port",
                          navigatorKey: navigatorKeys[2],
                        ),
                        NavigatorPage(
                          child: FundScreen(),
                          title: "fund",
                          navigatorKey: navigatorKeys[3],
                        ),
                        NavigatorPage(
                          child: AccountScreen(),
                          title: "account",
                          navigatorKey: navigatorKeys[4],
                        ),
                      ],
                    ),
                  ),
                  bottomNavigationBar: SuperFaBottomNavigationBar(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  fetchUserDetails() async {
    if (await internetCheck()) {
      loading = true;
      setState(() {});
      Map<String, String> data = {
        
        
             "user_id": sharedPreferences.getString(AllSharedPreferencesKey.userId),
        
      };
      apiPostRequest(data, AllUrls.customerdetails, this.context)
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
          if (jsonData["success"].toString() == "1") {
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

appBarDesign() {
  ColorChangeController colorChangeController = Get.find();
  DrawerOpen drawerOpen = Get.put(DrawerOpen());
  FocusNode _focusNode = new FocusNode();
  return AppBar(
    backgroundColor: pageBackGroundC,
    leadingWidth: 30,
    elevation: 0,
    centerTitle: true,
    leading: IconButton(
      padding: EdgeInsets.only(left: 10),
      icon: SvgPicture.asset(
        drawerIcon,
        color: white,
      ),
      onPressed: () {
        drawerOpen.xOffset.value = -150;
        drawerOpen.yOffset.value = 120;
        drawerOpen.isChange(true);
        drawerOpen.scaleFactor.value = 0.7;
      },
    ),
    title: Container(
      height: 40,
      // width: 700,
      decoration: BoxDecoration(
        color: pageBackGroundC,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: TextField(
        cursorColor: appColor,
        focusNode: _focusNode,
        style: TextStyle(
          color: white,
          fontFamily: "Nunito",
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: InputBorder.none,
          hintText: "Search anything",
          hintStyle: TextStyle(
            fontSize: 14,
            color: gray9B9797,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: white,
            size: 20,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 20,
                width: 1,
                child: VerticalDivider(
                  color: gray9B9797,
                ),
              ),
              IconButton(
                onPressed: () {
                  _focusNode.unfocus();
                  Get.bottomSheet(
                    Container(
                      color: pageBackGroundC,
                      padding:
                          const EdgeInsets.only(top: 29, left: 30, right: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: "PoppinsSemiBold",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                      color: appColor,
                                      fontFamily: "PoppinsMedium",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Obx(
                                () => MaterialButton(
                                  onPressed: () {
                                    if (colorChangeController
                                            .buttonCheck1.isTrue ||
                                        colorChangeController
                                            .buttonCheck2.isTrue) {
                                      colorChangeController.buttonCheck1(false);
                                      colorChangeController.buttonCheck2(false);
                                    }
                                    colorChangeController.buttonCheck1(true);
                                    if (colorChangeController
                                        .buttonCheck1.isTrue) {
                                      /* colorChangeController
                                                        .isCheck
                                                        .forEach(
                                                      (element) {
                                                        print("enter");
                                                        if (element == true) {
                                                          element = false;
                                                          print("enter check");
                                                        } else if (element ==
                                                            false) {
                                                          element = true;
                                                          print("enter check");
                                                        }
                                                      },
                                                    );*/
                                      colorChangeController.isCheck[0] = true;
                                      colorChangeController.isCheck[1] = true;
                                      colorChangeController.isCheck[2] = true;
                                      colorChangeController.isCheck[3] = true;
                                    }
                                  },
                                  elevation: 0,
                                  height: 32,
                                  minWidth: 88,
                                  color:
                                      colorChangeController.buttonCheck1.isTrue
                                          ? pageBackGroundC
                                          : pageBackGroundC,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: colorChangeController
                                              .buttonCheck1.isTrue
                                          ? transPrent
                                          : pageBackGroundC,
                                    ),
                                  ),
                                  child: Text(
                                    "Select All",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: appColor,
                                      fontFamily: "PoppinsMedium",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Obx(
                                () => MaterialButton(
                                  onPressed: () {
                                    if (colorChangeController
                                            .buttonCheck2.isTrue ||
                                        colorChangeController
                                            .buttonCheck1.isTrue) {
                                      colorChangeController.buttonCheck2(false);
                                      colorChangeController.buttonCheck1(false);
                                    }
                                    colorChangeController.buttonCheck2(true);
                                    if (colorChangeController
                                        .buttonCheck2.isTrue) {
                                      colorChangeController.isCheck[0] = false;
                                      colorChangeController.isCheck[1] = false;
                                      colorChangeController.isCheck[2] = false;
                                      colorChangeController.isCheck[3] = false;
                                    }
                                  },
                                  elevation: 0,
                                  height: 32,
                                  minWidth: 81,
                                  color:
                                      colorChangeController.buttonCheck2.isTrue
                                          ? pageBackGroundC
                                          : pageBackGroundC,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(
                                      color: colorChangeController
                                              .buttonCheck2.isTrue
                                          ? transPrent
                                          : Color(0xffDFDFDF),
                                    ),
                                  ),
                                  child: Text(
                                    "Clear All",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: appColor,
                                      fontFamily: "PoppinsMedium",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: bottomSheetListBuild.length,
                            itemBuilder: (context, index) => Obx(
                              () => ListTile(
                                onTap: () {
                                  colorChangeController.isCheck[index] =
                                      !colorChangeController.isCheck[index];
                                },
                                contentPadding: EdgeInsets.all(0),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                        bottomSheetListBuild[index]["img"]),
                                  ),
                                ),
                                title: Text(
                                  bottomSheetListBuild[index]["title"],
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: "PoppinsMedium",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 19,
                                  ),
                                ),
                                trailing:
                                    colorChangeController.isCheck[index] == true
                                        ? Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: appColor,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color: white,
                                              size: 12,
                                            ),
                                          )
                                        : SizedBox.shrink(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: pageBackGroundC,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    elevation: 2,
                  );
                },
                icon: SvgPicture.asset(
                  sort,
                  color: gray9B9797,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

// ignore: must_be_immutable
class SuperFaBottomNavigationBar extends StatelessWidget {
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      // init: ProfileController(),
      builder: (s) => Obx(
        () => BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: pageBackGroundC,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          unselectedLabelStyle: TextStyle(color: white),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                watchList,
                color: s.selectedIndex.value == 0 ? white : gray9B9797,
              ),
              /* Icon(Icons.home)*/
              label:
                  'Watchlist', /* Text(
                ,
                style: TextStyle(
                  fontSize: 10,
                  color: s.selectedIndex.value == 0
                      ? white
                      : gray9B9797,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),*/
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  oders,
                  color: s.selectedIndex.value == 1 ? white : gray9B9797,
                ),
                label:
                    "Order" /*Text(
                'Order',
                style: TextStyle(
                  fontSize: 10,
                  color: s.selectedIndex.value == 1
                      ? white
                      : gray9B9797,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),*/
                ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  portFolio,
                  color: s.selectedIndex.value == 2 ? white : gray9B9797,
                ),
                label:
                    "PortFolio" /*Text(
                'PortFolio',
                style: TextStyle(
                  fontSize: 10,
                  color: s.selectedIndex.value == 2
                      ? white
                      : gray9B9797,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),*/
                ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  fund,
                  color: s.selectedIndex.value == 3 ? white : gray9B9797,
                ),
                label:
                    "Fund" /*Text(
                'Fund',
                style: TextStyle(
                  fontSize: 10,
                  color: s.selectedIndex.value == 3
                      ? white
                      : gray9B9797,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),*/
                ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  user,
                  color: s.selectedIndex.value == 4 ? white : gray9B9797,
                ),
                label:
                    "Account" /*Text(
                'Account',
                style: TextStyle(
                  fontSize: 10,
                  color: s.selectedIndex.value == 4
                      ? white
                      : gray9B9797,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                ),
              ),*/
                ),
          ],
          currentIndex: s.selectedIndex.toInt(),
          selectedItemColor: white,
          unselectedItemColor: gray9B9797,
          selectedLabelStyle: TextStyle(
            fontSize: 15,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
          ),
          // unselectedItemColor: white.withOpacity(0.6),
          onTap: (index) => s.changeTabIndex(index),
        ),
      ),
    );
  }
}

class NavigatorPage extends StatelessWidget {
  final String title;
  final Widget child;
  final GlobalKey navigatorKey;

  NavigatorPage({this.navigatorKey, this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          settings: settings,
          maintainState: false,
          fullscreenDialog: false,
          page: () => child,

          // page: ()=>Scaffold(
          //   body: child,
          // ),
        );
      },
    );
  }
}
