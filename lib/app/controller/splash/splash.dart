import 'package:customer_app/app/data/repository/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  static  SplashController get to=> Get.put(SplashController());
  final repository = SplashRepository();
  final _firstTimeConnectionCheck = true.obs;

  get firstTimeConnectionCheck => _firstTimeConnectionCheck.value;

  set firstTimeConnectionCheck(value) {
    _firstTimeConnectionCheck.value = value;
  }

  final _hasConnection = true.obs;

  get hasConnection => _hasConnection.value;

  set hasConnection(value) {
    _hasConnection.value = value;
  }

  final _nearestRestaurantIndex = 1.obs;

  get nearestRestaurantIndex => _nearestRestaurantIndex.value;

  set nearestRestaurantIndex(value) {
    _nearestRestaurantIndex.value = value;
  }

  final _isConfigDataSuccess = false.obs;

  get isConfigDataSuccess => _isConfigDataSuccess.value;

  set isConfigDataSuccess(value) {
    _isConfigDataSuccess.value = value;
  }

  var configModel;

  getConfigData() async {
    hasConnection = true;
    try {
      var res = await repository.getConfigData();
    } catch (e) {
      debugPrint("error on get config data $e");
    }
  }
}
