import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ivykids_contacts/controller/firebaseFunctions.dart';
import 'package:ivykids_contacts/view/editContact/editContact.dart';

class contactDetailedScreen extends StatelessWidget {
  final Map<String, dynamic> contact;
  final int index;

  const contactDetailedScreen({Key? key, required this.contact, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(contact);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bgContacts.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.back(),
                      child: const FaIcon(FontAwesomeIcons.angleLeft,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.to(editContact(
                        contactDetails: contact, index: index
                      )),
                      child: const FaIcon(FontAwesomeIcons.edit,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 15),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    backgroundColor: yellow,
                    radius: 50,
                    child: Text(
                      contact["fName"][0].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 45, color: fontColor),
                    ),
                  ),
                ),
              ),
              Text(
                contact["fName"] +
                    " " +
                    (contact["mName"] != "" ? contact["mName"] + " " : "") +
                    contact["lName"],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                contact["occupation"],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 25, right: 25, top: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: Offset(0, 1), // changes position of shadow
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                            color: fontColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                          height: 30,
                          endIndent: 40),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path: contact["contact"].toString(),
                          );
                          await launchUrl(launchUri);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              color: blue,
                              size: 45,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Number",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: fontColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                Text(
                                  contact["contact"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: contact["email"].toString(),
                            query:
                                'subject=ivykids&body=Hello my name is Prince Singh',
                          );
                          var url = params.toString();
                          await launch(url);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.mail,
                              color: yellow,
                              size: 45,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: fontColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                Text(
                                  contact["email"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.business_center,
                            color: Colors.grey,
                            size: 45,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: fontColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                              Text(
                                contact["company"].toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          String url =
                              "https://wa.me/${contact["contact"]}/?text=Hello ivykids!";
                          launch(url);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.squareWhatsapp,
                                color: Colors.green.shade500, size: 45),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Whatsapp",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: fontColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                Text(
                                  contact["contact"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        // height: 40,
                        child: CupertinoButton(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                          onPressed: (){
                            deleteContact(index);
                            Get.back();
                          },
                          child: const DefaultTextStyle(
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            child: Text(
                              "Delete Contact",
                              style: TextStyle(
                                  color: Colors.white,
                                  // fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
