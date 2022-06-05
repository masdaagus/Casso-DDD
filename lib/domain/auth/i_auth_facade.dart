import 'package:casso/domain/auth/auth_failure.dart';
import 'package:casso/domain/auth/user.dart';
import 'package:casso/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, UserModel>> registerEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<Either<AuthFailure, UserModel>> signInEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, UserModel>> signWithGoogle();

  Future<Option<UserModel>> getSignedInUser();
  Future<Option<UserModel>> registerRestoAndEmploye({
    required RestoFields restoName,
    required RestoFields restoLocation,
    required RestoFields tableNumber,
  });

  Future<void> signOut();
}
