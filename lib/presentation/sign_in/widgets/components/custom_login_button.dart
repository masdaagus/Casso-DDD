import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    this.onTap,
    this.tittle = 'LOGIN',
  }) : super(key: key);

  final Function()? onTap;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: darkColor.withOpacity(.35),
              offset: const Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 8,
              color: lightColor.withOpacity(.40),
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            tittle,
            style: const TextStyle(
              color: darkColor,
              fontFamily: ubuntu,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
