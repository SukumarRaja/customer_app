import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

  final TextEditingController fName = TextEditingController();
  final TextEditingController lName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cPassword = TextEditingController();
  final TextEditingController referal = TextEditingController();

  final TextEditingController lPhone = TextEditingController();
  final TextEditingController lPassword = TextEditingController();

  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode pFocus = FocusNode();
  final FocusNode cPFocus = FocusNode();
  final FocusNode referalFocus = FocusNode();

  final FocusNode lPhoneFocus = FocusNode();
  final FocusNode lPasswordFocus = FocusNode();

  final _phoneCode = "+91".obs;

  get phoneCode => _phoneCode.value;

  set phoneCode(value) {
    _phoneCode.value = value;
  }

  final _exitFromApp = true.obs;

  get exitFromApp => _exitFromApp.value;

  set exitFromApp(value) {
    _exitFromApp.value = value;
  }

  final _canExit = false.obs;

  get canExit => _canExit.value;

  set canExit(value) {
    _canExit.value = value;
  }

  final _countryDialCode = "".obs;

  get countryDialCode => _countryDialCode.value;

  set countryDialCode(value) {
    _countryDialCode.value = value;
  }

  final _isActiveRememberMe = false.obs;

  get isActiveRememberMe => _isActiveRememberMe.value;

  set isActiveRememberMe(value) {
    _isActiveRememberMe.value = value;
  }

  final _acceptTerms = false.obs;

  get acceptTerms => _acceptTerms.value;

  set acceptTerms(value) {
    _acceptTerms.value = value;
  }

  final _isLoading = false.obs;

  get isLoading => _isLoading.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  final _verificationCode = "".obs;

  get verificationCode => _verificationCode.value;

  set verificationCode(value) {
    _verificationCode.value = value;
  }
}
