import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/notification/notification_res.dart';

class AppRoutes {
  static const String initial = '/';
  static const String splash = '/splash';

  static String getSplashRoute({required NotificationRes body}) {
    String data = 'null';
    List<int> encoded = utf8.encode(jsonEncode(body.toMap()));
    data = base64Encode(encoded);
    return '$splash?data=$data';
  }

  // static getRoute(Widget navigateTo) {
  //   int minimumVersion = 0;
  //   if(GetPlatform.isAndroid) {
  //     // minimumVersion = Get.find<SplashController>().configModel.appMinimumVersionAndroid;
  //   }else if(GetPlatform.isIOS) {
  //     // minimumVersion = Get.find<SplashController>().configModel.appMinimumVersionIos;
  //   }
  //   return AppConstants.APP_VERSION < minimumVersion ? UpdateScreen(isUpdate: true)
  //       : Get.find<SplashController>().configModel.maintenanceMode ? UpdateScreen(isUpdate: false)
  //       : Get.find<LocationController>().getUserAddress() != null ? navigateTo
  //       : AccessLocationScreen(fromSignUp: false, fromHome: false, route: Get.currentRoute);
  // }

  static  final routes = [

  ];
}
