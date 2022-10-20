import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utility/theme/colors.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.focusNode,
      this.nextFocus,
      required this.prefixIcon,
      this.maxLines = 1,
      this.showTitle = false,
      this.textAlign = TextAlign.start,
      this.inputAction = TextInputAction.next,
      this.isAmount = false,
      this.inputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.isEnabled = true,
      this.isPassword = false,
      this.isNumber = false,
      this.prefixSize = 10.0,
      this.onSubmit,
      this.divider = false})
      : super(key: key);
  final bool showTitle;
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextAlign textAlign;
  final TextInputAction inputAction;
  final TextCapitalization capitalization;
  final TextInputType inputType;
  final bool isAmount;
  final bool isEnabled;
  final bool isPassword;
  final bool isNumber;
  final bool divider;
  final String prefixIcon;
  final double prefixSize;
  final Function? onSubmit;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.showTitle
            ? Text(widget.hintText,
                style:
                    TextStyle(fontSize: Get.context!.width >= 1300 ? 16 : 12))
            : const SizedBox(),
        SizedBox(height: widget.showTitle ? 5.0 : 0),
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style: TextStyle(fontSize: Get.context!.width >= 1300 ? 20 : 16),
          textInputAction: widget.nextFocus == null
              ? TextInputAction.done
              : widget.inputAction,
          keyboardType:
              widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ]
              : widget.isAmount
                  ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
                  : widget.isNumber
                      ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))]
                      : null,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(width: 0, color: AppColors.grey.withOpacity(.1)),
              ),
              isDense: true,
              hintText: widget.hintText,
              fillColor: Theme.of(context).cardColor,
              hintStyle: TextStyle(
                  fontSize: Get.context!.width >= 1300 ? 20 : 16,
                  color: Theme.of(context).hintColor),
              // filled: true,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: widget.prefixSize),
                      child:
                          Image.asset(widget.prefixIcon, height: 20, width: 20),
                    )
                  : null,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Theme.of(context).hintColor.withOpacity(0.3)),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null),
          onSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
        ),
        widget.divider
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Colors.transparent,
                ))
            : const SizedBox(),
      ],
    );
  }
}
