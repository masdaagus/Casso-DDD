import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:casso/domain/auth/user.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(_Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          final userOption = await _authFacade.getSignedInUser();

          userOption.fold(
            () => emit(const AuthState.unauthenticated()),
            (user) {
              if (user.restoID != null) {
                UserModel(
                  email: user.email,
                  name: user.name,
                  password: user.password,
                  restoID: user.restoID,
                  status: user.status,
                  uid: user.uid,
                );

                log(user.toString());
                emit(const AuthState.authenticated());
              } else {
                emit(const AuthState.dontHaveRestoID());
              }
            },
          );
        },
        signedOut: (e) async {
          await _authFacade.signOut();
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
