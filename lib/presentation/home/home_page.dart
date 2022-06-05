import 'dart:developer';

import 'package:casso/domain/auth/user.dart';
import 'package:casso/presentation/core/constant.dart';
import 'package:casso/presentation/introduction/introduction_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MASDA AGUS',
              style: TextStyle(
                fontFamily: ubuntu,
                fontSize: dPadding,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  log(UserModel().toString());
                },
                child: Text("Move to introduction"))
          ],
        ),
      ),
    );
  }
}
