import 'package:customer_app/app/controller/splash/splash.dart';
import 'package:customer_app/app/controller/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/notification/notification_res.dart';
import '../../../routes/app_routes.dart';
import '../../../utility/theme/dark_theme.dart';
import '../../../utility/theme/light_theme.dart';
import '../login/login.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  // final Map<String, Map<String, String>>? languages;
  // final NotificationRes? body;

  @override
  Widget build(BuildContext context) {
    // if(GetPlatform.isWeb) {
    //   Get.find<SplashController>().initSharedData();
    //   if(Get.find<LocationController>().getUserAddress() != null && (Get.find<LocationController>().getUserAddress().zoneIds == null
    //       || Get.find<LocationController>().getUserAddress().zoneData == null)) {
    //     Get.find<AuthController>().clearSharedAddress();
    //   }
    //   Get.find<CartController>().getCartData();
    //   _route();
    // }
    // return GetBuilder<ThemeController>(builder: (theme) {
    //   return GetBuilder<ThemeController>(builder: (localization) {
    //     return GetBuilder<SplashController>(builder: (splash) {
    //       return GetPlatform.isWeb && splash.configModel == null
    //           ? const SizedBox()
    //           : GetMaterialApp(
    //               title: "Customer App",
    //               debugShowCheckedModeBanner: false,
    //               navigatorKey: Get.key,
    //               scrollBehavior: const MaterialScrollBehavior().copyWith(
    //                 dragDevices: {
    //                   PointerDeviceKind.mouse,
    //                   PointerDeviceKind.touch
    //                 },
    //               ),
    //               // theme: theme.darkTheme ? dark : light,
    //               // locale: localization.locale,
    //               // translations: Messages(languages: languages),
    //               // fallbackLocale: Locale(AppConstants.languages[0].languageCode, AppConstants.languages[0].countryCode),
    //               // initialRoute: GetPlatform.isWeb
    //               //     ? AppRoutes.initial
    //               //     // : AppRoutes.getSplashRoute(body: body),
    //               //     : '/splash',
    //               // routes: AppRoutes.routes,
    //         home: LoginPage(),
    //               defaultTransition: Transition.topLevel,
    //               transitionDuration: const Duration(milliseconds: 500),
    //             );
    //     });
    //   });
    // });
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
