import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ivykids_contacts/model/colors.dart';
import 'package:ivykids_contacts/view/splashScreen/splashScreen.dart';
import 'package:ivykids_contacts/firebaseQuery/authentication_repo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => Get.put(authentication_repo()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return splash(context);
        }
        return GetMaterialApp(
            theme: ThemeData(
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            ),
            debugShowCheckedModeBanner: false,
            title: 'ivykids Contacts',
            home: Scaffold(
              backgroundColor: Colors.black,
              body: splash(context),
            ),
        );
      },
    );
  }
}

Widget splash(context){
  return Container(
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
  );
}