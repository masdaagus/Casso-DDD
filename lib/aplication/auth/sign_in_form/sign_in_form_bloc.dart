import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:casso/domain/auth/auth_failure.dart';
import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:casso/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
        emailChanged: (e) {
          final emailState = state.copyWith(
            emailAddress: EmailAddress(e.email),
            authFailureOrSuccessOption: none(),
          );
          emit(emailState);
        },
        passwordChanged: (e) {
          final passwordState = state.copyWith(
            password: Password(e.password),
            authFailureOrSuccessOption: none(),
          );

          emit(passwordState);
        },
        registerWithEmailAndPassword: (e) async {
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();

          if (isPasswordValid && isEmailValid) {
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            );

            await _authFacade
                .registerEmailAndPassword(
                  emailAddress: state.emailAddress,
                  password: state.password,
                )
                .then(
                  (value) => emit(
                    state.copyWith(
                      isSubmitting: false,
                      showErrorMessages: true,
                      authFailureOrSuccessOption: optionOf(value),
                    ),
                  ),
                );
          }
          // _performActionOnAuthFacadeWithEmailAndPassword(
          //   _authFacade.registerEmailAndPassword,
          // );
        },
        signInWithEmailAndPassword: (e) async {
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();

          if (isPasswordValid && isEmailValid) {
            state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            );

            await _authFacade
                .signEmailAndPassword(
                  emailAddress: state.emailAddress,
                  password: state.password,
                )
                .then(
                  (value) => emit(
                    state.copyWith(
                      isSubmitting: false,
                      showErrorMessages: true,
                      authFailureOrSuccessOption: optionOf(value),
                    ),
                  ),
                );
          }
        },
        signInWithGooglePressed: (e) async {
          final startState = state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          );
          emit(startState);

          await _authFacade.signWithGoogle().then((value) {
            emit(state.copyWith(
              isSubmitting: false,
              showErrorMessages: true,
              authFailureOrSuccessOption: some(value),
            ));
          });
        },
      );
    });
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwadedCall,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSucces;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    log('is password valid = $isPasswordValid');
    if (isEmailValid && isPasswordValid) {
      state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
      forwadedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSucces),
      );
    }
  }
}
