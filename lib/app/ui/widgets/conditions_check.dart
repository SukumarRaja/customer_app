import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth.dart';

class ConditionCheckBox extends StatelessWidget {
  const ConditionCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Obx(() => GestureDetector(
          onTap: () {
            AuthController.to.acceptTerms = !AuthController.to.acceptTerms;
          },
          child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.only(right: 15, left: 15),
            decoration: BoxDecoration(
                border: Border.all(
                    color: AuthController.to.acceptTerms == true
                        ? Colors.transparent
                        : Colors.black54,
                    width: 2),
                color: AuthController.to.acceptTerms == true
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(2)),
            child: Center(
                child: Icon(
              Icons.done,
              size: 15,
              color: AuthController.to.acceptTerms == true
                  ? Colors.white
                  : Colors.black54,
            )),
          ))),
      Text('i_agree_with'.tr,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
      InkWell(
        onTap: () {
          // Get.toNamed(RouteHelper.getHtmlRoute('terms-and-condition'));
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text('terms_conditions'.tr,
              style: const TextStyle(color: Colors.blue)),
        ),
      ),
    ]);
  }
}
