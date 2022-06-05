import 'package:casso/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'resto.freezed.dart';
part 'resto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class Restaurant with _$Restaurant {
  const factory Restaurant({
    final String? createAt,
    final String? expiredAt,
    final String? ownerEmail,
    final String? ownerName,
    final String? restoName,
    final String? restoLocation,
    final double? restoTaxes,
    final List<Product>? products,
    final List<UserModel>? employes,
    final List<Table>? tables,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class Product with _$Product {
  const factory Product({
    final String? productName,
    final double? productPrice,
    final String? productCategory,
    final String? productDescription,
    final int? productStock,
    final String? productImageUrl,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@freezed
@JsonSerializable(explicitToJson: true)
class Table with _$Table {
  const factory Table({
    final int? tableNumber,
    final String? guessName,
  }) = _Table;

  factory Table.fromJson(Map<String, dynamic> json) => _$TableFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TableToJson(this);
}
