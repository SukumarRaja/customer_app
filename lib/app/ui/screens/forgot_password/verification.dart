import 'package:customer_app/app/controller/auth/auth.dart';
import 'package:customer_app/app/controller/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../widgets/common_app_bar.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'otp_verification'.tr),
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
                  child: GetBuilder(
                    init: AuthController(),
                    builder: (_) {
                      return Column(
                        children: [
                          Obx(() => SplashController.to.configModelDemo == true
                              ? Text(
                                  'for_demo_purpose'.tr,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        Get.context!.width >= 1300 ? 18 : 14,
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(children: [
                                  TextSpan(
                                      text: 'enter_the_verification_sent_to'.tr,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).disabledColor)),
                                  TextSpan(
                                      text: ' +91 9585884353',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color)),
                                ]))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 39, vertical: 35),
                            child: PinCodeTextField(
                              length: 4,
                              appContext: context,
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.slide,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                fieldHeight: 60,
                                fieldWidth: 60,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(5.0),
                                selectedColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                selectedFillColor: Colors.white,
                                inactiveFillColor: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2),
                                inactiveColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                                activeColor: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.4),
                                activeFillColor: Theme.of(context)
                                    .disabledColor
                                    .withOpacity(0.2),
                              ),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              onChanged: (data) {
                                AuthController.to.verificationCode = data;
                              },
                              beforeTextPaste: (text) => true,
                            ),
                          ),


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
    );
  }
}
