import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class UserModel with _$UserModel {
  const factory UserModel({
    final String? uid,
    final String? name,
    final String? email,
    final String? status,
    final String? restoID,
    final String? password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
