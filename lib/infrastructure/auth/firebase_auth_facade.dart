// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:casso/domain/auth/auth_failure.dart';
import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:casso/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      log("error kenapa ini ${e.code}");
      // return left(const AuthFailure.emailAlreadyInUse());
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      log("code nya adalah = ${e.code}");
      if (e.code == 'wrong-password' ||
          e.code == 'user-not-found' ||
          e.code == 'invalid-email') {
        return left(const AuthFailure.invalidEmailAndPassword());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        log('cancel by user');
        return left(const AuthFailure.cancelByUser());
      }
      final googleAutentification = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAutentification.idToken,
        accessToken: googleAutentification.accessToken,
      );
      try {
        return _firebaseAuth
            .signInWithCredential(authCredential)
            .then((r) => right(unit));
      } catch (e) {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }
}
