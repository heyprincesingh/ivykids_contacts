import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:ivykids_contacts/view/contactsScreen/contactsScreen.dart';
import 'package:ivykids_contacts/view/logIn_signup/signUpDetail.dart';

class logIn extends StatelessWidget {
  logIn({Key? key}) : super(key: key);

  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(authentication_repo());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  opacity: 0.3,
                  image: NetworkImage(
                      "https://previews.123rf.com/images/rawpixel/rawpixel1706/rawpixel170658154/81286855-group-of-diverse-kids-playing-at-the-field-together.jpg"))),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LOG IN",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Enter your login details",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  Enter Details",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: mailController,
                            cursorColor: Colors.black87,
                            maxLines: 1,
                            minLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xff8C8FA5),
                              ),
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F4F8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            controller: passController,
                            cursorColor: Colors.black87,
                            maxLines: 1,
                            minLines: 1,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color(0xff8C8FA5),
                              ),
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(10),
                        color: yellow,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          authentication_repo.instance
                              .logInWithEmailAndPassword(
                                  mailController.text.trim(),
                                  passController.text.trim())
                              .then((value) => authentication_repo
                                          .instance.firebaseUser.value ==
                                      null
                                  ? Get.snackbar("Invalid Details",
                                      'Invalid email id or password',
                                      backgroundColor: Colors.white,
                                      snackPosition: SnackPosition.BOTTOM)
                                  : Get.offAll(() => contactsScreen()));
                        },
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                // fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),

                    //Google Login
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "OR",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: () => authentication_repo.instance.googleSignIn(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff4f86ec),
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Image(image: NetworkImage("https://www.outsystems.com/forge/DownloadResource.aspx?FileName=&ImageBinaryId=43951"),fit: BoxFit.fitHeight,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15),
                                  child: Text(
                                    "Sign Up with Google",
                                    style: TextStyle(
                                        color: Colors.white,
                                        // fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => {
                    FocusScope.of(context).unfocus(),
                    Get.to(signUpDetails()),
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "DON'T HAVE ACCOUNT ",
                        style: TextStyle(
                          fontSize: 14,
                          color: yellow,
                        ),
                      ),
                      Text(
                        " SIGN UP",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
