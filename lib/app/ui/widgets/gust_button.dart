import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(1, 40),
      ),
      onPressed: () {
        // Navigator.pushReplacementNamed(context, RouteHelper.getInitialRoute());
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: '${'continue_as'.tr} ',
                style: TextStyle(color: Theme.of(context).disabledColor)),
            TextSpan(
                text: 'guest'.tr,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1!.color)),
          ],
        ),
      ),
    );
  }
}
