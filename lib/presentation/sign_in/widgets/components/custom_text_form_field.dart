import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.icon,
      this.stringValidation,
      this.isObsecure = false,
      this.controller,
      this.validator,
      this.isPassword = false,
      this.tapToHide,
      this.onChanged})
      : super(key: key);

  final String? stringValidation;
  final String? hintText;
  final IconData? icon;
  final bool isObsecure;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? tapToHide;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      // height: 48,
      decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     lightColor,
          //     biru.withOpacity(.1),
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          color: lightColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: darkColor.withOpacity(.16),
              offset: const Offset(4, 4),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  autocorrect: false,
                  keyboardType: isPassword ? TextInputType.number : null,
                  controller: controller,
                  obscureText: isObsecure,
                  validator: validator,
                  onChanged: onChanged,
                  style: const TextStyle(
                    color: darkColor,
                    fontFamily: ubuntu,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Icon(icon, color: darkColor.withOpacity(.7)),
                    ),
                    hintStyle: TextStyle(
                      color: darkColor.withOpacity(.7),
                      fontFamily: ubuntu,
                    ),
                  ),
                ),
              ),
              isPassword
                  ? GestureDetector(
                      onTap: tapToHide,
                      child: Container(
                        width: 48,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: darkColor.withOpacity(.7),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(width: 8)
            ],
          ),
          (stringValidation != null)
              ? Container(
                  margin: const EdgeInsets.only(left: 56, bottom: 8),
                  child: Text(
                    stringValidation!,
                    style:
                        const TextStyle(color: darkColor, fontFamily: ubuntu),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
