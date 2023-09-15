import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:ivykids_contacts/controller/contactsScreenController.dart';
import 'package:ivykids_contacts/view/addContactScreen/addContactScreen.dart';
import 'package:ivykids_contacts/view/contactsScreen/contactDetailedScreen/contactDetailedScreen.dart';

class contactsScreen extends StatelessWidget {
  const contactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(contactsScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: yellow,
        shape: const CircleBorder(),
        onPressed: () => Get.to(addContactScreen()),
        child: Icon(Icons.person_add),
      ),
      appBar: AppBar(
        backgroundColor: yellow,
        title: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                "assets/logo mark.png",
                color: Colors.black,
                width: 100,
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Image.asset(
                  "assets/logo mark.png",
                  width: 100,
                ),
              ),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              final authController = Get.find<authentication_repo>();
              authController.logout();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Icon(
                FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final userModel = controller.usersContacts.value;
          if (userModel != null) {
            return ListView.builder(
              itemCount: userModel.details.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Get.to(contactDetailedScreen(
                      contact: userModel.details[index], index: index)),
                  child: Container(
                    height: 75,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.grey),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: yellow,
                            radius: 50,
                            child: Text(
                              userModel.details[index]["fName"][0].toString(),
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${userModel.details[index]["fName"]} ${userModel.details[index]["lName"]}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: fontColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                userModel.details[index]["contact"].toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          InkWell(
                            splashColor: Colors.grey.shade300,
                            customBorder: const CircleBorder(),
                            onTap: () => controller.makePhoneCall(
                                userModel.details[index]["contact"].toString()),
                            child: Ink(
                              width: 50,
                              height: 50,
                              child: const Icon(
                                Icons.phone_enabled_rounded,
                                color: Colors.black87,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
