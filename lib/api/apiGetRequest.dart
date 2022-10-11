import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mymoney/utils/internetCheck.dart';
import 'package:mymoney/utils/showOfflineSnakbar.dart';
import 'package:http/http.dart' as http;

apiGetRequest(BuildContext context, String url) async {
  // if (await internetCheck()) {
  log(url);

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
      );
    log(response.body.toString());

      return response.body;
    } catch (e) {}
  // } else {
  //   showOfflineSnakbar(context);
  // }
}
