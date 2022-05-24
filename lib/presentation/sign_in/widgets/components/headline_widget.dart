import 'package:flutter/material.dart';

import '../../../core/constant.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 24, bottom: 32),
      child: Text(
        "Casso",
        style: TextStyle(
          fontFamily: ubuntu,
          color: darkColor,
          fontWeight: FontWeight.bold,
          fontSize: 64,
        ),
      ),
    );
  }
}
