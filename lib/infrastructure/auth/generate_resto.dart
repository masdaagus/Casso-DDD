import 'dart:developer';
import 'dart:math' as math;

import 'package:casso/domain/auth/i_auth_facade.dart';
import 'package:casso/domain/core/errors.dart';
import 'package:casso/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:casso/infrastructure/core/firestore_helper.dart';

import '../../domain/auth/resto.dart';
import '../../domain/auth/user.dart';

extension GenerateResto on FirebaseFirestore {
  static math.Random r = math.Random();
  Future<void> generateRestoAndEmploye({
    required String restoName,
    required String restoLocation,
    required String restoTable,
    required UserModel userModel,
  }) async {
    DateTime now = DateTime.now();

    String rndm = List.generate(4, (_) => r.nextInt(9)).join("").toString();

    final employe = generateEmploye(userModel, rndm);
    final products = generateProduct();
    log(userModel.uid!);
    try {
      final checkUser = await getUser('cashier$rndm@casso.com');

      while (checkUser.data() == null) {
        for (var i = 0; i < employe.length; i++) {
          await setUser(
              employe[i].email!,
              UserModel(
                email: employe[i].email!,
                name: employe[i].name,
                password: employe[i].password,
                restoID: employe[i].restoID,
                status: employe[i].status,
                uid: employe[i].uid,
              ).toJson());
        }

        break;
      }
      final List<Table> tables = [];
      int _tableCount = int.parse(restoTable);

      for (var i = 0; i < _tableCount; i++) {
        tables.add(Table(guessName: null, tableNumber: i + 1));
      }
      DateTime expAt = now.add(Duration(days: 24));

      log(userModel.uid!);

      await setresto(
          userModel.uid!,
          Restaurant(
            createAt: now.toIso8601String(),
            expiredAt: expAt.toIso8601String(),
            ownerEmail: userModel.email ?? 'kosong',
            ownerName: userModel.name ?? 'kosong',
            restoName: 'kosong',
            restoLocation: 'kosong',
            restoTaxes: 0,
            employes: employe,
            products: products,
            tables: tables,
          ).toJson());

      log('panjang table aman ');

      await updateUser(userModel.email!, {
        'restoID': userModel.uid,
      });
    } catch (e) {}
  }
}

List<UserModel> generateEmploye(UserModel user, String random) {
  final List<UserModel> employe = [
    UserModel(
      name: user.name,
      email: user.email,
      status: "OWNER",
      restoID: user.uid,
      password: '123456',
      uid: user.uid,
    ),
    UserModel(
      name: "Kitchen",
      email: "kitchen$random@casso.com",
      status: "KITCHEN",
      restoID: user.uid,
      password: '123456',
      uid: null,
    ),
    UserModel(
      name: "Cashier",
      email: "cashier$random@casso.com",
      status: "CASHIER",
      restoID: user.uid,
      password: '123456',
      uid: null,
    ),
    UserModel(
      name: "Waiter",
      email: "waiter$random@casso.com",
      status: "WAITERS",
      restoID: user.uid,
      password: '123456',
      uid: null,
    ),
  ];

  return employe;
}

List<Product> generateProduct() {
  final List<Product> products = [
    Product(
        productName: 'Nasi Goreng',
        productPrice: 5000,
        productCategory: 'FOOD',
        productDescription: null,
        productStock: 50,
        productImageUrl:
            'https://www.foodforfitness.co.uk/wp-content/uploads/2018/05/IMG_7741-2000x1333.jpg'),
    Product(
        productName: 'Teh Manis',
        productPrice: 5000,
        productCategory: 'DRINK',
        productDescription: null,
        productStock: 50,
        productImageUrl:
            'https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/2020/10/13/1521986007.jpg'),
    Product(
        productName: 'Kentang Goreng',
        productPrice: 10000,
        productCategory: 'DESSERT',
        productDescription: null,
        productStock: 50,
        productImageUrl:
            'https://1.bp.blogspot.com/-szZPDTLOWDU/V7pftmWHq2I/AAAAAAAAB-8/fLvvL88OLvghYxNbDlMx0NrYQsTd1iTuACLcB/s1600/69.-Cara-Mudah-Membuat-Kentang-Goreng-Renyah-di-Rumah.jpg'),
  ];
  return products;
}
