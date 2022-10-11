import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/main.dart';
import 'package:mymoney/res/allSharePreferencesKey.dart';
import 'package:mymoney/screen/welcome/welcome_screen.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/data.dart';
import 'package:mymoney/utils/imagenames.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: pageBackGroundC,
      child: Padding(
        padding:
            EdgeInsets.only(top: Get.height / 9.48, left: Get.width / 10.28),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.width * 0.2,
              width: Get.width * 0.2,
              padding: EdgeInsets.all(Get.width * 0.03),
              decoration: BoxDecoration(
                color: pageBackGroundC,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff40000000),
                    spreadRadius: 0.5,
                    blurRadius: 3,
                    offset: Offset(0, 6),
                  )
                ],
              ),
              child: SvgPicture.asset(user, color: white),
            ),
            // CircleAvatar(
            //   maxRadius: 35,
            //   backgroundImage: AssetImage(personImage),
            //   backgroundColor: white,
            // ),
            SizedBox(
              height: Get.height / 59.42,
            ),
            Container(
              width: Get.width / 4.57,
              height: Get.height / 12.73,
              child: Text(
                sharedPreferences.getString(AllSharedPreferencesKey.fullName),
                style: TextStyle(
                  fontSize: 19,
                  color: white,
                  fontFamily: "TitilliumWebSemiBold",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            /* SizedBox(
              height: 10
            ),*/
            Padding(
              padding: EdgeInsets.only(left: Get.width / 3.29),
              child: Container(
                color: pageBackGroundC,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: drawerList.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      print("d vev eve");
                      if (index == 7) {
                        Get.defaultDialog(
                          backgroundColor: black,
                          barrierDismissible: true,
                          title: "",
                          contentPadding: EdgeInsets.all(0),
                          titlePadding: EdgeInsets.all(0),
                          content: Container(
                            color: pageBackGroundC,
                            width: Get.width,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  logOut,
                                  color: redEB5757,
                                  height: 43,
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                Text(
                                  "Are you sure you want to Logout.?",
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: "NunitoSemiBold",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 23,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      height: 39,
                                      minWidth: 118,
                                      onPressed: () {
                                        sharedPreferences.setString(
                                            AllSharedPreferencesKey.userId, "");
                                        Get.to(WelcomeScreen());
                                      },
                                      color: pageBackGroundC,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        side:
                                            BorderSide(color: white, width: 1),
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                          12,
                                        ),
                                      ),
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 18,
                                          fontFamily: "NunitoBold",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22,
                                    ),
                                    MaterialButton(
                                      height: 39,
                                      minWidth: 118,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: appColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                          12,
                                        ),
                                      ),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                          color: white,
                                          fontSize: 18,
                                          fontFamily: "NunitoBold",
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    leading: SvgPicture.asset(
                      drawerList[index]["img"],
                      height: Get.height / 44.571,
                    ),
                    minLeadingWidth: Get.width / 20.57,
                    title: Text(
                      drawerList[index]["title"],
                      style: TextStyle(
                        fontSize: Get.width / 21.65,
                        color: white,
                        fontFamily: "NunitoSemiBold",
                        fontWeight: FontWeight.w600,
                      ),
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
}
