
import 'package:mymoney/res/allColor.dart';
import 'package:flutter/material.dart';

customCardItemGradinet() {
  return BoxDecoration(
      color: AllColor.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      gradient:
          LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
              // begin: Alignment(-5, 1),
              // end: Alignment(0, 0),
              colors: [
            Color(0xff59C173),
            Color(0xffa17fe0),
            Color(0xff5D26C1),
            // Color.fromRGBO(0, 212, 255, 1),
            // Color.fromRGBO(2, 0, 36, 1)
          ]));
}
