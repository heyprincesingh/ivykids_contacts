import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:ivykids_contacts/model/user_model.dart';
import 'package:ivykids_contacts/controller/contactsScreenController.dart';
import 'package:ivykids_contacts/view/contactsScreen/contactsScreen.dart';


Rx<UserModel?> usersContacts = Rx<UserModel?>(null);

Future<UserModel?> getData() async {
  final authController = Get.find<authentication_repo>();
  final db = FirebaseFirestore.instance;
  final snapshot = await db
      .collection("users")
      .where("userId", isEqualTo: authController.Uid)
      .get();

  if (snapshot.docs.isNotEmpty) {
    final userData = UserModel.fromSnapshot(snapshot.docs.last);
    usersContacts.value = userData;
    return usersContacts.value;
  } else {
    print("Document not found");
    usersContacts.value = null;
  }
}

Future addNewContact(newContact) async{
  final authController = Get.find<authentication_repo>();
  final db = FirebaseFirestore.instance;
  usersContacts.toJson()["details"].add(newContact);
  db.collection("users").doc(authController.Uid).update(usersContacts.toJson());

  final updatedData = await getData();
  final controller = Get.find<contactsScreenController>();
  controller.updateUserContacts(updatedData);
  Get.back();
  Get.snackbar("Congrats!", "New contact added",backgroundColor: yellow,snackPosition: SnackPosition.BOTTOM);
}

Future updateContactDetail(updatedData, index) async {
  final authController = Get.find<authentication_repo>();
  usersContacts.value!.details[index] = updatedData;

  final db = FirebaseFirestore.instance;
  await db.collection("users").doc(authController.Uid).update(usersContacts.value!.toJson());

  final controller = Get.find<contactsScreenController>();
  controller.updateUserContacts(usersContacts.value);
  Get.offAll(contactsScreen());
  Get.snackbar("Success!", "Contact updated", backgroundColor: yellow, snackPosition: SnackPosition.BOTTOM);
}


Future<void> deleteContact(int index) async {
  final authController = Get.find<authentication_repo>();
  final db = FirebaseFirestore.instance;
  usersContacts.toJson()["details"].removeAt(index);
  db.collection("users").doc(authController.Uid).update(usersContacts.toJson());

  final updatedData = await getData();
  final controller = Get.find<contactsScreenController>();
  controller.updateUserContacts(updatedData);
  Get.back();
  Get.snackbar("Success!", "Selected contact deleted",backgroundColor: yellow,snackPosition: SnackPosition.BOTTOM);
}