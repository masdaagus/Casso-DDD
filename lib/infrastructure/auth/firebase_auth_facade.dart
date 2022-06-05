// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:casso/domain/auth/auth_failure.dart';
import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:casso/domain/auth/user.dart';
import 'package:casso/infrastructure/auth/generate_resto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'employe_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:casso/domain/auth/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:casso/infrastructure/core/firestore_helper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
  );

  UserCredential? _userCre;
  UserModel? _userModel;

  @override
  Future<Either<AuthFailure, UserModel>> registerEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailStr,
            password: passwordStr,
          )
          .then((val) => _userCre = val);

      log("user uid = ${_userCre!.user!.uid}");

      UserModel user = UserModel(
        uid: _userCre!.user!.uid,
        name: _userCre!.user!.email,
        email: _userCre!.user!.email,
        status: 'OWNER',
        password: passwordStr,
        restoID: null,
      );

      _userModel = user;

      await _firestore.setUser(user.email!, user.toJson());

      return left(const DontHaveRestoID());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>> signInEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.getOrCrash();
    final passwordStr = password.getOrCrash();

    final userDoc = await _firestore.getUser(emailStr);

    if (emailStr.contains('@casso.com')) {
      log('contain casso.com');
      try {
        if (userDoc != null) {
          box.remove(emailKey);
          box.remove(passwordKey);

          final userData = userDoc.data()!;
          final newUser = UserModel.fromJson(userData);

          if (passwordStr == newUser.password) {
            await box.write(emailKey, newUser.email);
            await box.write(passwordKey, newUser.password);
            if (newUser.restoID != null) {
              return right(newUser);
            } else {
              return left(const DontHaveRestoID());
            }
          } else {
            return left(const AuthFailure.invalidEmailAndPassword());
          }
        }
      } catch (e) {
        log('GAGAL LOGIN DENGAN EMPLOYE ID');
      }
    } else {
      try {
        await _firebaseAuth
            .signInWithEmailAndPassword(
              email: emailStr,
              password: passwordStr,
            )
            .then((value) => _userCre = value);

        final userData = userDoc.data()!;
        final newUser = UserModel.fromJson(userData);

        _userModel = newUser;

        if (newUser.restoID != null) {
          return right(newUser);
        } else {
          return left(const DontHaveRestoID());
        }
      } on FirebaseAuthException catch (_) {
        return left(const AuthFailure.invalidEmailAndPassword());
      }
    }
    return left(const AuthFailure.serverError());
  }

  @override
  Future<Either<AuthFailure, UserModel>> signWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        log('cancel by user');
        return left(const AuthFailure.cancelByUser());
      }

      /// go to splash screen
      final googleAutentification = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAutentification.idToken,
        accessToken: googleAutentification.accessToken,
      );
      try {
        _userCre = await _firebaseAuth.signInWithCredential(authCredential);

        final newUser = _userCre!.user!;
        final _curUser = await _firestore.getUser(newUser.email!);
        final _curUserDocData = _curUser.data();

        if (_curUserDocData != null) {
          final finalUser = UserModel.fromJson(_curUserDocData);

          _userModel = finalUser;

          if (finalUser.restoID != null) {
            return right(finalUser);
          } else {
            return left(const DontHaveRestoID());
          }
        } else {
          final user = UserModel(
            uid: newUser.uid,
            email: newUser.email,
            name: newUser.displayName,
            status: 'OWNER',
            password: null,
            restoID: null,
          );

          await _firestore.setUser(user.email!, user.toJson());
          return left(const DontHaveRestoID());
        }
      } catch (e) {
        return left(const AuthFailure.serverError());
      }
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Option<UserModel>> getSignedInUser() async {
    final _curUser = _firebaseAuth.currentUser;

    final boxEmail = box.read(emailKey);
    final boxPassword = box.read(passwordKey);

    try {
      if (boxEmail != null && boxPassword != null) {
        final userDoc = await _firestore.getUser(boxEmail);
        final userData = userDoc.data()!;
        final newUser = UserModel.fromJson(userData);
        _userModel = newUser;
        if (newUser.password == boxPassword) {
          return optionOf(newUser);
        }
      }
    } catch (e) {
      ///
    }

    if (_curUser != null) {
      try {
        final userDoc = await _firestore.getUser(_curUser.email!);
        final userData = userDoc.data()!;
        final newUser = UserModel.fromJson(userData);

        if (newUser.restoID != null) {
          return optionOf(newUser);
        } else {
          return none();
        }
      } catch (e) {
        return none();
      }
    } else {
      return none();
    }
  }

  @override
  Future<Option<UserModel>> registerRestoAndEmploye({
    required RestoFields restoName,
    required RestoFields restoLocation,
    required RestoFields tableNumber,
  }) async {
    final restoNameStr = restoName.getOrCrash();
    final restoLocationStr = restoLocation.getOrCrash();
    final restoTableNumberStr = tableNumber.getOrCrash();

    log(_userModel!.email!);

    try {
      await _firestore.generateRestoAndEmploye(
        restoName: restoNameStr,
        restoLocation: restoLocationStr,
        restoTable: restoTableNumberStr,
        userModel: _userModel!,
      );
    } catch (e) {}
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
        box.remove(emailKey),
        box.remove(passwordKey),
      ]);
}
