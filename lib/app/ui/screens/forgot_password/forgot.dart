import 'package:customer_app/app/ui/screens/forgot_password/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/auth.dart';
import '../../../controller/forgot/forgot.dart';
import '../../../utility/theme/colors.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_button.dart';
import '../../widgets/country_code_form_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(title: widget.fromSocialLogin ? 'phone'.tr : 'forgot_password'.tr),
      appBar: CommonAppBar(title: 'forgot_password'.tr),
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  width: context.width > 700 ? 700 : context.width,
                  padding:
                      context.width > 700 ? const EdgeInsets.all(15.0) : null,
                  decoration: context.width > 700
                      ? BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5.0),
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
                  child: Column(
                    children: [
                      Image.asset("assets/images/forgot.png", height: 220),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Text('please_enter_mobile'.tr,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              fontSize: Get.context!.width >= 1300 ? 18 : 14,
                            ),
                            textAlign: TextAlign.center),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Theme.of(context).cardColor,
                        ),
                        child: CountryCodeTextFormField(
                          maxLength: 10,
                          buttonHintTextColor: AppColors.grey,
                          borderColor: AppColors.grey.withOpacity(0.1),
                          controller: ForgotPasswordController.to.phone,
                          nextFocus: ForgotPasswordController.to.phoneFocus,
                          initialCountryCode: "IN",
                          onSaved: (phone) {
                            ForgotPasswordController.to.phoneCode =
                                phone!.countryCode;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Obx(() => AuthController.to.isLoading == false
                          ? CommonButton(
                              buttonText: 'next'.tr,
                              transparent: true,
                              // onPressed: () => Get.toNamed(RouteHelper.getSignUpRoute()),
                              onPressed: () {
                                Get.to(() => VerificationPage());
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
