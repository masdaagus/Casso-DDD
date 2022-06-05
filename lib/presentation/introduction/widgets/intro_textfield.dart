import 'package:flutter/material.dart';

import '../../core/constant.dart';

class TextFormFieldIntroduction extends StatelessWidget {
  const TextFormFieldIntroduction(
      {Key? key, this.labeltext, this.icon, this.onChanged})
      : super(key: key);

  final String? labeltext;
  final IconData? icon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: dPadding),
      // height: 48,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(dPadding / 3),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: darkColor.withOpacity(.4),
            offset: Offset(4, 4),
          )
        ],
      ),
      child: TextFormField(
        style: TextStyle(fontFamily: ubuntu, color: darkColor),
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          labelText: labeltext,
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            size: dPadding * 1.6,
            color: darkColor.withOpacity(.5),
          ),
          labelStyle: TextStyle(
            color: darkColor.withOpacity(.5),
            fontFamily: ubuntu,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
