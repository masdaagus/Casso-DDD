import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({
    Key? key,
    this.onTap,
    this.isRegister = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: dPadding * 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isRegister ? 'Already have an account' : "Don't have an account",
            style: TextStyle(
              color: darkColor.withOpacity(.8),
              fontFamily: ubuntu,
              // fontSize: 14,
            ),
          ),
          SizedBox(width: 4),
          GestureDetector(
            onTap: onTap,
            child: Text(
              isRegister ? "LOGIN" : 'REGISTER',
              style: TextStyle(
                color: Color(0XFFE19D0A),
                fontFamily: ubuntu,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
