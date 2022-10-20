import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/auth.dart';
import '../../../responsive/responsive.dart';
import '../../../utility/theme/colors.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_text_form_field.dart';
import '../../widgets/conditions_check.dart';
import '../../widgets/country_code_form_field.dart';
import '../../widgets/gust_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //WebMenuBar()
      appBar: ResponsiveHelper.isDesktop(context) ? AppBar() : null,
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Container(
                width: context.width > 700 ? 700 : context.width,
                padding: context.width > 700 ? const EdgeInsets.all(15) : null,
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
                        Image.asset('assets/images/logo_name.png', width: 100),
                        const SizedBox(height: 25),
                        Text('sign_up'.tr.toUpperCase(),
                            style: const TextStyle(fontSize: 30)),
                        const SizedBox(height: 50),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Get.isDarkMode
                                      ? Colors.grey.shade800
                                      : Colors.grey.shade200,
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ],
                          ),
                          child: Column(
                            children: [
                              CommonTextFormField(
                                hintText: "first_name".tr,
                                controller: AuthController.to.fName,
                                focusNode: AuthController.to.fNameFocus,
                                nextFocus: AuthController.to.lNameFocus,
                                inputType: TextInputType.text,
                                capitalization: TextCapitalization.words,
                                prefixIcon: "assets/images/user.png",
                                divider: true,
                              ),
                              CommonTextFormField(
                                hintText: "last_name".tr,
                                controller: AuthController.to.lName,
                                focusNode: AuthController.to.lNameFocus,
                                nextFocus: AuthController.to.phoneFocus,
                                inputType: TextInputType.text,
                                capitalization: TextCapitalization.words,
                                prefixIcon: "assets/images/user.png",
                                divider: true,
                              ),
                              CountryCodeTextFormField(
                                maxLength: 10,
                                buttonHintTextColor: AppColors.grey,
                                borderColor: AppColors.grey.withOpacity(0.1),
                                controller: AuthController.to.phone,
                                focusNode: AuthController.to.phoneFocus,
                                nextFocus: AuthController.to.pFocus,
                                initialCountryCode: "IN",
                                onSaved: (phone) {
                                  AuthController.to.phoneCode =
                                      phone!.countryCode;
                                },
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5)),
                              CommonTextFormField(
                                hintText: "password".tr,
                                controller: AuthController.to.password,
                                focusNode: AuthController.to.pFocus,
                                nextFocus: AuthController.to.cPFocus,
                                inputType: TextInputType.visiblePassword,
                                prefixIcon: "assets/images/lock.png",
                                isPassword: true,
                                divider: true,
                              ),
                              CommonTextFormField(
                                hintText: "confirm_password".tr,
                                controller: AuthController.to.cPassword,
                                focusNode: AuthController.to.cPFocus,
                                // nextFocus: Get.find<SplashController>().configModel.refEarningStatus == 1 ? _referCodeFocus : null,
                                nextFocus: AuthController.to.referalFocus,
                                // inputAction: Get.find<SplashController>()
                                //             .configModel
                                //             .refEarningStatus ==
                                //         1
                                //     ? TextInputAction.next
                                //     : TextInputAction.done,
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.visiblePassword,
                                prefixIcon: "assets/images/lock.png",
                                isPassword: true,
                                // divider: Get.find<SplashController>().configModel.refEarningStatus == 1 ? true : false,
                                divider: true,
                                // onSubmit: (text) => (GetPlatform.isWeb && authController.acceptTerms) ? _register(authController, _countryDialCode) : null,
                              ),

                              // (Get.find<SplashController>().configModel.refEarningStatus == 1 ) ?

                              CommonTextFormField(
                                hintText: 'refer_code'.tr,
                                controller: AuthController.to.referal,
                                focusNode: AuthController.to.referalFocus,
                                inputAction: TextInputAction.done,
                                inputType: TextInputType.text,
                                capitalization: TextCapitalization.words,
                                prefixIcon: "assets/images/refer_code.png",
                                divider: false,
                                prefixSize: 14,
                              )
                              // : SizedBox(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const ConditionCheckBox(),
                        const SizedBox(height: 10.0),
                        Obx(() => AuthController.to.isLoading == false
                            ? Row(
                                children: [
                                  Expanded(
                                      child: CommonButton(
                                          buttonText: 'sign_up'.tr,
                                          transparent: true,
                                          // onPressed: () => Get.toNamed(RouteHelper.getSignUpRoute()),
                                          onPressed: () {
                                            Get.back();
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
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
