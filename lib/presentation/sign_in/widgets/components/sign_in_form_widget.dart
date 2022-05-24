import 'dart:developer';
import 'dart:ui';

import 'package:casso/presentation/sign_in/widgets/components/custom_login_button.dart';
import 'package:casso/presentation/sign_in/widgets/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../aplication/auth/sign_in_form/sign_in_form_bloc.dart';
import '../../../core/constant.dart';
import 'headline_widget.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    Key? key,
  }) : super(key: key);

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
                listener: (context, state) {},
                builder: (context, state) {
                  return Form(
                    autovalidateMode: AutovalidateMode.always,
                    onChanged: () {
                      final isvalidEmail = state.emailAddress.isValid();
                      log('emailnya valid ga  = $isvalidEmail');
                    },
                    child: Column(
                      children: [
                        // HEADLINE TEXT CASSO
                        HeadlineWidget(),

                        TextFormField(),
                        CustomTextField(
                          hintText: 'Email or ID',
                          icon: Icons.person_outline_outlined,
                          onChanged: (val) {
                            context.read<SignInFormBloc>().add(
                                  SignInFormEvent.emailChanged(val),
                                );
                          },
                          validator: (_) {
                            context
                                .read<SignInFormBloc>()
                                .state
                                .emailAddress
                                .value
                                .fold(
                                  (f) => f.maybeMap(
                                    invalidEmail: (_) => 'Invalid Email',
                                    orElse: () => log('or rlse'),
                                  ),
                                  (_) => null,
                                );
                          },
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          icon: Icons.lock_outlined,
                          isPassword: true,
                          onChanged: (val) {
                            context.read<SignInFormBloc>().add(
                                  SignInFormEvent.passwordChanged(val),
                                );
                          },
                          validator: (_) {
                            context
                                .read<SignInFormBloc>()
                                .state
                                .password
                                .value
                                .fold(
                                  (f) => f.maybeMap(
                                    invalidEmail: (_) => 'Short Password',
                                    orElse: () => null,
                                  ),
                                  (_) => null,
                                );
                            return;
                          },
                        ),
                        LoginButton(
                          onTap: () {
                            context.read<SignInFormBloc>().add(
                                  SignInFormEvent
                                      .registerWithEmailAndPassword(),
                                );
                            // context.read<SignInFormBloc>().add(
                            //       SignInFormEvent.signInWithGooglePressed(),
                            //     );
                          },
                        ),
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
