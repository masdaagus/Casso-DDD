part of 'auth_bloc.dart';

@immutable
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.dontHaveRestoID() = DontHaveRestoID;
}
