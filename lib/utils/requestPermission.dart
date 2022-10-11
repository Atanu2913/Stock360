
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermission(
    Permission permission, BuildContext context) async {
  if (await permission.status.isGranted) {
    return true;
  } else {
    // if (await permissionAlert(context, permission)) {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
    // }
    // return false;
  }
}

