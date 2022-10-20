import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controller/auth/auth.dart';
import '../../../responsive/responsive.dart';
import '../../../utility/theme/colors.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text_form_field.dart';
import '../../widgets/conditions_check.dart';
import '../../widgets/country_code_form_field.dart';
import '../../widgets/gust_button.dart';
import '../sign_in/sign_in.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (AuthController.to.exitFromApp == true) {
          if (GetPlatform.isWeb ? AuthController.to.canExit == true : false) {
            if (GetPlatform.isAndroid) {
              SystemNavigator.pop();
            } else if (GetPlatform.isIOS) {
              exit(0);
            } else {
              // Navigator.pushNamed(context, RouteHelper.getInitialRoute());
            }
            return Future.value(false);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('back_press_again_to_exit'.tr,
                  style: const TextStyle(color: Colors.white)),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(10),
            ));
            AuthController.to.canExit = true;
            Timer(const Duration(seconds: 2), () {
              AuthController.to.canExit = false;
            });
            return Future.value(false);
          }
        } else {
          return true;
        }
      },
      child: Scaffold(
        // WebMenuBar()
        appBar: ResponsiveHelper.isDesktop(context)
            ? AppBar()
            : !AuthController.to.exitFromApp
                ? AppBar(
                    leading: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios_rounded,
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent)
                : null,
        body: SafeArea(
          child: Center(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Container(
                    width: context.width > 700 ? 700 : context.width,
                    padding:
                        context.width > 700 ? const EdgeInsets.all(15.0) : null,
                    decoration: context.width > 700
                        ? BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Get.isDarkMode
                                      ? Colors.grey.shade700
                                      : Colors.grey.shade300,
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ],
                          )
                        : null,
                    child: GetBuilder(
                      init: AuthController(),
                      builder: (_) {
                        return Column(
                          children: [
                            Image.asset('assets/images/logo.png', width: 100),
                            const SizedBox(height: 10),
                            Image.asset('assets/images/logo_name.png',
                                width: 100),
                            const SizedBox(height: 25),
                            Text('sign_in'.tr.toUpperCase(),
                                style: const TextStyle(fontSize: 30)),
                            const SizedBox(height: 50),
                            Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Get.isDarkMode
                                            ? Colors.grey.shade800
                                            : Colors.grey.shade200,
                                        spreadRadius: 1,
                                        blurRadius: 5)
                                  ]),
                              child: Column(
                                children: [
                                  //phone

                                  CountryCodeTextFormField(
                                    maxLength: 10,
                                    buttonHintTextColor: AppColors.grey,
                                    borderColor:
                                        AppColors.grey.withOpacity(0.1),
                                    controller: AuthController.to.lPhone,
                                    focusNode: AuthController.to.lPhoneFocus,
                                    nextFocus: AuthController.to.lPasswordFocus,
                                    initialCountryCode: "IN",
                                    onSaved: (phone) {
                                      AuthController.to.phoneCode =
                                          phone!.countryCode;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),

                                  //password
                                  CommonTextFormField(
                                    hintText: "password".tr,
                                    controller: AuthController.to.lPassword,
                                    focusNode: AuthController.to.lPasswordFocus,
                                    inputType: TextInputType.visiblePassword,
                                    inputAction: TextInputAction.done,
                                    prefixIcon: "assets/images/lock.png",
                                    isPassword: true,
                                    divider: true,
                                  ),

                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      buildRememberMe(),
                                      TextButton(
                                        // onPressed: () => Get.toNamed(RouteHelper.getForgotPassRoute(false, null)),
                                        onPressed: () {},
                                        child: Text('${'forgot_password'.tr}?'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const ConditionCheckBox(),
                                  const SizedBox(height: 10),
                                  Obx(() => AuthController.to.isLoading == false
                                      ? Row(
                                          children: [
                                            Expanded(
                                                child: CommonButton(
                                                    buttonText: 'sign_up'.tr,
                                                    transparent: true,
                                                    // onPressed: () => Get.toNamed(RouteHelper.getSignUpRoute()),
                                                    onPressed: () {
                                                      Get.to(() => SignIn());
                                                    })),
                                            Expanded(
                                                child: CommonButton(
                                                    buttonText: 'sign_in'.tr,
                                                    transparent: true,
                                                    // onPressed: authController.acceptTerms ? () => _login(authController, _countryDialCode) : null,
                                                    onPressed: () {}))
                                          ],
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        )),
                                  const SizedBox(height: 30),
                                  const GuestButton()
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildRememberMe() {
    return Expanded(
        child: Row(
      children: [
        Obx(() => GestureDetector(
            onTap: () {
              AuthController.to.isActiveRememberMe =
                  !AuthController.to.isActiveRememberMe;
            },
            child: Container(
              height: 20,
              width: 20,
              margin: const EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AuthController.to.isActiveRememberMe == true
                          ? Colors.transparent
                          : Colors.black54,
                      width: 2),
                  color: AuthController.to.isActiveRememberMe == true
                      ? Colors.blue
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(2)),
              child: Center(
                  child: Icon(
                Icons.done,
                size: 15,
                color: AuthController.to.isActiveRememberMe == true
                    ? Colors.white
                    : Colors.black54,
              )),
            ))),
        Text('remember_me'.tr)
      ],
    ));
  }
}
