import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mymoney/screen/auth/signup/signup_screen.dart';
import 'package:mymoney/utils/media_height_width.dart';
import '../auth/login/login_screen.dart';
import 'package:mymoney/utils/buttons_widget.dart';
import 'package:mymoney/utils/color.dart';
import 'package:mymoney/utils/imagenames.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: pageBackGroundC,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SvgPicture.asset(appLogo),
                Column(
                  children: [
                    Image.asset(appLogo,
                        width: Get.width * 0.3, height: Get.width * 0.3),
                    SizedBox(height: Get.width * 0.05),
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        fontFamily: "NunitoSemiBold",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Stocks",
                          style: TextStyle(
                            color: appGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            fontFamily: "NunitoBold",
                          ),
                        ),
                        Text(
                          " Trade 360",
                          style: TextStyle(
                            color: white,
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            fontFamily: "NunitoBold",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  children: [
                    loginButton(
                        textLabel: "Login",
                        onTapButton: () {
                          Get.to(
                            LogInScreen(),
                          );
                        }),
                    Container(
                      height: Get.width * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Nunito",
                            color: white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text(
                            " Sign up",
                            style: TextStyle(
                              fontSize: 14,
                              color: appColor,
                              fontFamily: "NunitoSemiBold",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Powered By",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        " Ativa",
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "NunitoSemiBold",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
