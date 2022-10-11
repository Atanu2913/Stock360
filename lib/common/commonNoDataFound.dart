import 'package:mymoney/res/allColor.dart';
import 'package:flutter/material.dart';
import 'package:mymoney/res/allString.dart';
import 'package:mymoney/utils/customMarginCardItem.dart';

commonNoDataFound() {
  return Center(
    child: Container(
      margin: customMarginCardItem(),
      child: Text(
        AllString.noDataFound,
        style: TextStyle(color: AllColor.black),
      ),
    ),
  );
}
