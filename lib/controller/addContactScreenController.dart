import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ivykids_contacts/controller/firebaseFunctions.dart';

class addContactScreenController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  void saveData() {
    Map<String, dynamic> newContact = {
      "fName": firstNameController.text,
      "mName": middleNameController.text,
      "lName": lastNameController.text,
      "contact": contactController.text,
      "email": emailController.text,
      "company": companyController.text,
      "occupation": occupationController.text,
    };
    addNewContact(newContact);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    emailController.dispose();
    companyController.dispose();
    occupationController.dispose();
    super.dispose();
  }

}
