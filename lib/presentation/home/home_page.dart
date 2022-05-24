import 'package:casso/presentation/core/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'MASDA AGUS',
              style: TextStyle(
                fontFamily: ubuntu,
                fontSize: dPadding,
              ),
            ),
            Text(
              'MASDA AGUS',
              style: TextStyle(
                fontFamily: ubuntu,
                fontSize: dPadding,
              ),
            ),
            Text(
              'MASDA AGUS',
              style: TextStyle(
                fontFamily: ubuntu,
                fontSize: dPadding,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
