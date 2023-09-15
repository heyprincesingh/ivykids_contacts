import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ivykids_contacts/controller/firebaseFunctions.dart';

class editContactController extends GetxController{

  RxMap contactDetails = {}.obs;
  RxInt index = 0.obs;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  @override
  void onReady() {
    firstNameController.text = contactDetails["fName"].toString();
    middleNameController.text = contactDetails["mName"].toString();
    lastNameController.text = contactDetails["lName"].toString();
    contactController.text = contactDetails["contact"].toString();
    emailController.text = contactDetails["email"].toString();
    companyController.text = contactDetails["company"].toString();
    occupationController.text = contactDetails["occupation"].toString();
    super.onReady();
  }

  void updateData() {
    Map<String, dynamic> updatedContact = {
      "fName": firstNameController.text,
      "mName": middleNameController.text,
      "lName": lastNameController.text,
      "contact": contactController.text,
      "email": emailController.text,
      "company": companyController.text,
      "occupation": occupationController.text,
    };
    updateContactDetail(updatedContact, index.value);
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