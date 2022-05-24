import 'package:casso/presentation/core/constant.dart';
import 'package:casso/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casso',
      home: SignInPage(),
      theme: ThemeData(
        primaryColor: lightColor,
        backgroundColor: lightColor,
        scaffoldBackgroundColor: lightColor,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(dPadding),
          ),
        ),
      ),
    );
  }
}
