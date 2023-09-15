import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivykids_contacts/controller/splashScreenController.dart';
import 'package:ivykids_contacts/model/colors.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(splashScreenController());
    return Scaffold(
      body: Container(
        color: black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Image.asset(
            "assets/logo.png",
            width: MediaQuery.of(context).size.width / 2,
            // height: 100,
          ),
        ),
      ),
    );
  }
}