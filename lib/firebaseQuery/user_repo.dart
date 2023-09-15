import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';
import 'package:ivykids_contacts/model/user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.put(UserRepo());
  final authentication = Get.put(authentication_repo());

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection("users").doc(authentication.Uid).set(user.toJson()).whenComplete(
          () => Get.snackbar(
        'Success',
        'Your account created successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
      ),
    );
  }
}
