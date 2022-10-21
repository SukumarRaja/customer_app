import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get to=>Get.put(ForgotPasswordController());

  final TextEditingController phone = TextEditingController();

  final FocusNode phoneFocus = FocusNode();


  final _phoneCode = "+91".obs;

  get phoneCode => _phoneCode.value;

  set phoneCode(value) {
    _phoneCode.value = value;
  }

}