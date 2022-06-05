import 'package:flutter/material.dart';

import '../../core/constant.dart';

class IntroButton extends StatelessWidget {
  const IntroButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: lightColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: black.withOpacity(.35),
              offset: Offset(4, 4),
            ),
            BoxShadow(
              blurRadius: 8,
              color: white.withOpacity(.40),
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'NEXT',
            style: TextStyle(
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
