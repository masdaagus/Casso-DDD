// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
//       createAt: json['createAt'] as String?,
//       expiredAt: json['expiredAt'] as String?,
//       ownerEmail: json['ownerEmail'] as String?,
//       ownerName: json['ownerName'] as String?,
//       restoName: json['restoName'] as String?,
//       restoLocation: json['restoLocation'] as String?,
//       restoTaxes: (json['restoTaxes'] as num?)?.toDouble(),
//       products: (json['products'] as List<dynamic>?)
//           ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       employes: (json['employes'] as List<dynamic>?)
//           ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       tables: (json['tables'] as List<dynamic>?)
//           ?.map((e) => Table.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'createAt': instance.createAt,
      'expiredAt': instance.expiredAt,
      'ownerEmail': instance.ownerEmail,
      'ownerName': instance.ownerName,
      'restoName': instance.restoName,
      'restoLocation': instance.restoLocation,
      'restoTaxes': instance.restoTaxes,
      'products': instance.products?.map((e) => e.toJson()).toList(),
      'employes': instance.employes?.map((e) => e.toJson()).toList(),
      'tables': instance.tables?.map((e) => e.toJson()).toList(),
    };

// Product _$ProductFromJson(Map<String, dynamic> json) => Product(
//       productName: json['productName'] as String?,
//       productPrice: (json['productPrice'] as num?)?.toDouble(),
//       productCategory: json['productCategory'] as String?,
//       productDescription: json['productDescription'] as String?,
//       productStock: json['productStock'] as int?,
//       productImageUrl: json['productImageUrl'] as String?,
//     );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productStock': instance.productStock,
      'productImageUrl': instance.productImageUrl,
    };

// Table _$TableFromJson(Map<String, dynamic> json) => Table(
//       tableNumber: json['tableNumber'] as int?,
//       guessName: json['guessName'] as String?,
//     );

Map<String, dynamic> _$TableToJson(Table instance) => <String, dynamic>{
      'tableNumber': instance.tableNumber,
      'guessName': instance.guessName,
    };

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      createAt: json['createAt'] as String?,
      expiredAt: json['expiredAt'] as String?,
      ownerEmail: json['ownerEmail'] as String?,
      ownerName: json['ownerName'] as String?,
      restoName: json['restoName'] as String?,
      restoLocation: json['restoLocation'] as String?,
      restoTaxes: (json['restoTaxes'] as num?)?.toDouble(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      employes: (json['employes'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tables: (json['tables'] as List<dynamic>?)
          ?.map((e) => Table.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'createAt': instance.createAt,
      'expiredAt': instance.expiredAt,
      'ownerEmail': instance.ownerEmail,
      'ownerName': instance.ownerName,
      'restoName': instance.restoName,
      'restoLocation': instance.restoLocation,
      'restoTaxes': instance.restoTaxes,
      'products': instance.products,
      'employes': instance.employes,
      'tables': instance.tables,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      productName: json['productName'] as String?,
      productPrice: (json['productPrice'] as num?)?.toDouble(),
      productCategory: json['productCategory'] as String?,
      productDescription: json['productDescription'] as String?,
      productStock: json['productStock'] as int?,
      productImageUrl: json['productImageUrl'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productStock': instance.productStock,
      'productImageUrl': instance.productImageUrl,
    };

_$_Table _$$_TableFromJson(Map<String, dynamic> json) => _$_Table(
      tableNumber: json['tableNumber'] as int?,
      guessName: json['guessName'] as String?,
    );

Map<String, dynamic> _$$_TableToJson(_$_Table instance) => <String, dynamic>{
      'tableNumber': instance.tableNumber,
      'guessName': instance.guessName,
    };
