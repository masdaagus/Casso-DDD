import 'dart:developer';
import 'dart:ui';

import 'package:casso/presentation/core/strings.dart';
import 'package:casso/presentation/home/home_page.dart';
import 'package:casso/presentation/introduction/introduction_page.dart';
import 'package:casso/presentation/sign_in/widgets/components/login_button.dart';
import 'package:casso/presentation/sign_in/widgets/components/password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../aplication/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../core/constant.dart';
import '../style/headline_widget.dart';
import 'email_form.dart';
import 'login_google_button.dart';
import 'register_text_register.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final _key = GlobalKey<FormState>();

  bool isRegister = false;
  void isRegisterFunc() {
    isRegister = !isRegister;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 45,
            sigmaY: 45,
          ),
          child: AnimatedContainer(
            duration: dur,
            width: size.width,
            height: size.height * .65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightColor.withOpacity(.55),
                  lightColor.withOpacity(.45),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              physics: bouncing,
              child: BlocConsumer<SignInFormBloc, SignInFormState>(
                listener: (context, state) {
                  state.authFailureOrSuccessOption.fold(
                    () {},
                    (either) => either.fold((failure) {
                      failure.map(cancelByUser: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Cancel by user")));
                      }, serverError: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Server Error")));
                      }, emailAlreadyInUse: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Email sudah terdaftar")));
                      }, invalidEmailAndPassword: (_) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Email atau Password anda salah")));
                      }, dontHaveRestoID: (_) {
                        /// navigate to introduction
                        log('dont have resto id');

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => IntroductionPage()),
                          ),
                        );
                      });
                    }, (user) {
                      /// move other page

                      log("resto id = ${user.restoID}");

                      if (user.restoID != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HomePage()),
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => IntroductionPage()),
                          ),
                        );
                      }
                    }),
                  );
                },
                builder: (context, state) {
                  final bloc = context.read<SignInFormBloc>();
                  return Stack(
                    children: [
                      Form(
                        key: _key,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            // HEADLINE TEXT CASSO
                            HeadlineWidget(),
                            EmailFormField(
                              onChanged: (val) =>
                                  bloc.add(SignInFormEvent.emailChanged(val)),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ecnull;
                                }
                                return state.emailAddress.value.fold(
                                  (f) => f.maybeMap(
                                    invalidEmail: (_) => einvalid,
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                );
                              },
                            ),
                            const SizedBox(height: dPadding),
                            PasswordFormField(
                              onChanged: (val) => bloc
                                  .add(SignInFormEvent.passwordChanged(val)),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return pcnull;
                                }
                                return state.password.value.fold(
                                  (f) => f.maybeMap(
                                    shortPassword: (_) => pclength,
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                );
                              },
                            ),
                            const SizedBox(height: dPadding),
                            isRegister
                                ? PasswordFormField(
                                    validate: true,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return pcnull;
                                      }
                                      return state.password.value.fold(
                                        (f) => f.maybeMap(
                                          shortPassword: (_) => pclength,
                                          orElse: () => null,
                                        ),
                                        (r) {
                                          if (r == val) {
                                            return null;
                                          } else {
                                            return pnmatch;
                                          }
                                        },
                                      );
                                    },
                                  )
                                : SizedBox(),

                            LoginButton(
                              isRegister: isRegister,
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  isRegister
                                      ? bloc.add(SignInFormEvent
                                          .registerWithEmailAndPassword())
                                      : bloc.add(SignInFormEvent
                                          .signInWithEmailAndPassword());
                                }
                              },
                            ),
                            LoginWithGoogleButton(
                              onTap: () {
                                bloc.add(
                                    SignInFormEvent.signInWithGooglePressed());
                              },
                            ),
                            RegisterTextButton(
                              isRegister: isRegister,
                              onTap: () => isRegisterFunc(),
                            ),

                            SizedBox(height: dPadding * 2),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
