import 'package:casso/aplication/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:casso/presentation/core/constant.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SignInForm(),
    );
  }
}
