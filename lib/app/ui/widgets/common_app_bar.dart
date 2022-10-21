import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_widget.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {Key? key,
      required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.showCart = false})
      : super(key: key);
  final String title;
  final bool isBackButtonExist;
  final bool showCart;

  final Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    // WebMenuBar()
    return GetPlatform.isDesktop
        ? AppBar()
        : AppBar(
            title: Text(title,
                style: TextStyle(
                    fontSize: Get.context!.width >= 1300 ? 20 : 16,
                    color: Theme.of(context).textTheme.bodyText1!.color)),
            centerTitle: true,
            leading: isBackButtonExist
                ? IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).textTheme.bodyText1!.color,
                    onPressed: () => onBackPressed != null
                        ? onBackPressed!()
                        : Navigator.pop(context),
                  )
                : const SizedBox(),
            backgroundColor: Theme.of(context).cardColor,
            elevation: 0,
            actions: showCart
                ? [
                    IconButton(
                      // onPressed: () => Get.toNamed(RouteHelper.getCartRoute()),
                      onPressed: () {
                        // Get.to(()=>CartScreen());
                      },
                      icon: CartWidget(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          size: 25),
                    )
                  ]
                : null,
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
