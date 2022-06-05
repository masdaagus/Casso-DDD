import 'package:bloc/bloc.dart';
import 'package:casso/domain/auth/auth_failure.dart';
import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:casso/domain/auth/user.dart';
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
          final ns = state.copyWith(
            emailAddress: EmailAddress(e.email),
            authFailureOrSuccessOption: none(),
          );
          emit(ns);
        },
        passwordChanged: (e) {
          final ns = state.copyWith(
            password: Password(e.password),
            authFailureOrSuccessOption: none(),
          );
          emit(ns);
        },
        registerWithEmailAndPassword: (e) async {
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();

          if (isPasswordValid && isEmailValid) {
            emit(state.copyWith(isSubmitting: true));

            await _authFacade
                .registerEmailAndPassword(
                  emailAddress: state.emailAddress,
                  password: state.password,
                )
                .then((value) => emit(state.copyWith(
                      isSubmitting: false,
                      showErrorMessages: true,
                      authFailureOrSuccessOption: optionOf(value),
                    )));
          }
        },
        signInWithEmailAndPassword: (e) async {
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();

          if (isPasswordValid && isEmailValid) {
            emit(state.copyWith(isSubmitting: true));

            await _authFacade
                .signInEmailAndPassword(
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
          emit(state.copyWith(isSubmitting: true));

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
}
