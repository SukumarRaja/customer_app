import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key,
      required this.onPressed,
      this.transparent = false,
      this.width,
      this.height,
      this.radius = 5,
      this.margin,
      this.icon,
      required this.buttonText,
      this.fontSize})
      : super(key: key);
  final Function() onPressed;
  final bool transparent;
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsets? margin;
  final IconData? icon;
  final String buttonText;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : Theme.of(context).primaryColor,
      minimumSize: Size(width ?? 1170, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
    return Center(
      child: SizedBox(
        width: width ?? 1170,
        child: Padding(
          padding:  EdgeInsets.all(0),
          child: TextButton(
            onPressed: onPressed,
            style: flatButtonStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Icon(icon,
                            color: transparent
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).cardColor),
                      )
                    : const SizedBox(),
                Text(buttonText ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: transparent
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                      fontSize: fontSize ?? 16,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
