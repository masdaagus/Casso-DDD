import 'dart:developer';
import 'dart:ui';

import 'package:casso/presentation/home/home_page.dart';
import 'package:casso/presentation/sign_in/widgets/components/login_button.dart';
import 'package:casso/presentation/sign_in/widgets/components/password_form.dart';
import 'package:flutter/cupertino.dart';
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
                      failure.map(
                        cancelByUser: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Cancel by user")));
                        },
                        serverError: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Server Error")));
                        },
                        emailAlreadyInUse: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Email sudah terdaftar")));
                        },
                        invalidEmailAndPassword: (_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Email atau Password anda salah")));
                        },
                      );
                    }, (r) {
                      /// move other page
                      log('masuk nih');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => HomePage()),
                        ),
                      );
                    }),
                  );
                },
                builder: (context, state) {
                  final bloc = context.read<SignInFormBloc>();
                  return Form(
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
                              return '                Email or ID tidak boleh kosong';
                            }
                            return state.emailAddress.value.fold(
                              (f) => f.maybeMap(
                                invalidEmail: (_) =>
                                    '                Email invalid',
                                orElse: () => null,
                              ),
                              (_) => null,
                            );
                          },
                        ),
                        const SizedBox(height: dPadding),
                        PasswordFormField(
                          onChanged: (val) =>
                              bloc.add(SignInFormEvent.passwordChanged(val)),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return '                Password tidak boleh kosong';
                            }
                            return state.password.value.fold(
                              (f) => f.maybeMap(
                                shortPassword: (_) =>
                                    '                Password kurang dari 6 character',
                                orElse: () => null,
                              ),
                              (_) => null,
                            );
                          },
                        ),
                        const SizedBox(height: dPadding),
                        isRegister
                            ? Column(
                                children: [
                                  PasswordFormField(
                                    validate: true,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return '                Password tidak boleh kosong';
                                      }
                                      return state.password.value.fold(
                                        (f) => f.maybeMap(
                                          shortPassword: (_) =>
                                              '                Password kurang dari 6 character',
                                          orElse: () => null,
                                        ),
                                        (r) {
                                          if (r == val) {
                                            null;
                                          } else {
                                            return '                Password belum cocok';
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
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
                            bloc.add(SignInFormEvent.signInWithGooglePressed());
                          },
                        ),
                        RegisterTextButton(
                          isRegister: isRegister,
                          onTap: () => isRegisterFunc(),
                        ),

                        SizedBox(height: dPadding * 4),
                      ],
                    ),
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
