import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.put(AuthController());

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
}
