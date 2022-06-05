import 'package:casso/domain/auth/user.dart';
import 'package:casso/presentation/home/home_page.dart';
import 'package:casso/presentation/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../aplication/auth/auth_bloc.dart';
import '../introduction/introduction_page.dart';

class SplassPage extends StatelessWidget {
  const SplassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('in SplassPage ');
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
            initial: (_) {},
            authenticated: (c) {
              log('AUTHENTECATED');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => HomePage()),
                ),
              );
            },
            unauthenticated: (_) async {
              log('UN AUTHENTECATED');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => SignInPage()),
                ),
              );
            },
            dontHaveRestoID: (_) async {
              log('dont have resto ID');

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: ((context) => IntroductionPage()),
                ),
              );
            });
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Text('splash'),
    //   ),
    // );
  }
}
