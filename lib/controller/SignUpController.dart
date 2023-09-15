import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:ivykids_contacts/model/user_model.dart';
import '../firebaseQuery/user_repo.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.put(SignUpController());

  final authentication = Get.put(authentication_repo());

  final name = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();

  final userRepo = Get.put(UserRepo());

  Future<void> registerUser(String email, String password) async {
    await authentication_repo.instance
        .createUserWithEmailAndPassword(email, password);
    final user = UserModel(
      name: name.text.trim(),
      email: email,
      userId: authentication.Uid,
      details: [],
    );
    createUser(user);
  }

  void createUser(UserModel user) {
    userRepo.createUser(user);
  }
}
