import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

apiPostRequest(Map<String,String> data, String url, BuildContext context) async {
  // if (await internetCheck()) {
  String body = json.encode(data);
  log(url);

  log(url);

  try {
    var headers = {'Content-Type': 'application/json'};
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(url),
    );
    request.fields.addAll(data);
  log(request.fields.toString());

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    log(url + "\n" + response.toString());
    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      log(jsonData.toString());
      return jsonData;
    }
  } catch (e) {}
}
