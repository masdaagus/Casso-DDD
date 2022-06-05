// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
//       uid: json['uid'] as String?,
//       name: json['name'] as String?,
//       email: json['email'] as String?,
//       status: json['status'] as String?,
//       restoID: json['restoID'] as String?,
//       password: json['password'] as String?,
//     );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'restoID': instance.restoID,
      'password': instance.password,
    };

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      restoID: json['restoID'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'status': instance.status,
      'restoID': instance.restoID,
      'password': instance.password,
    };
